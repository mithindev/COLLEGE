const express = require('express');
const router = express.Router();
const pool = require('../models/db');

// Create a new appointment
router.post('/create-appointment', async (req, res) => {
  const { patient_id, doctor_id, appointment_date, status } = req.body;
  try {
    const newAppointment = await pool.query(
      'INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES ($1, $2, $3, $4) RETURNING *',
      [patient_id, doctor_id, appointment_date, status]
    );
    res.json(newAppointment.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get all appointments
router.get('/get-all-appointments', async (req, res) => {
  try {
    const appointments = await pool.query('SELECT * FROM appointments');
    res.json(appointments.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Update an appointment by ID
router.put('/update-appointment-by-id/:id', async (req, res) => {
  const { id } = req.params;
  const { status } = req.body; // Assuming we only want to update the status for this example
  try {
    const updatedAppointment = await pool.query(
      'UPDATE appointments SET status = $1 WHERE appointment_id = $2 RETURNING *',
      [status, id]
    );
    if (updatedAppointment.rows.length === 0) {
      return res.status(404).json({ error: 'Appointment not found' });
    }
    res.json(updatedAppointment.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Delete an appointment by ID
router.delete('/delete-appointment-by-id/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const deletedAppointment = await pool.query('DELETE FROM appointments WHERE appointment_id = $1 RETURNING *', [id]);
    if (deletedAppointment.rows.length === 0) {
      return res.status(404).json({ error: 'Appointment not found' });
    }
    res.json({ message: 'Appointment canceled successfully', appointment: deletedAppointment.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
