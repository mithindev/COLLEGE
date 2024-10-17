const express = require('express');
const router = express.Router();
const pool = require('../models/db');
const bcrypt = require('bcryptjs');


router.get('/get-all-doctors', async (req, res) => {
  try {
    const doctors = await pool.query('SELECT * FROM doctors');
    res.json(doctors.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

router.get('/get-doctor-by-id/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const doctor = await pool.query('SELECT * FROM doctors WHERE doctor_id = $1', [id]);
    if (doctor.rows.length === 0) {
      return res.status(404).json({ error: 'Doctor not found' });
    }
    res.json(doctor.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

router.put('/update-doctor-by-id/:id', async (req, res) => {
  const { id } = req.params;
  const { name, specialization, contact_info } = req.body;
  try {
    const updatedDoctor = await pool.query(
      'UPDATE doctors SET name = $1, specialization = $2, contact_info = $3 WHERE doctor_id = $4 RETURNING *',
      [name, specialization, contact_info, id]
    );
    if (updatedDoctor.rows.length === 0) {
      return res.status(404).json({ error: 'Doctor not found' });
    }
    res.json(updatedDoctor.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

router.delete('/delete-doctor-by-id/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const deletedDoctor = await pool.query('DELETE FROM doctors WHERE doctor_id = $1 RETURNING *', [id]);
    if (deletedDoctor.rows.length === 0) {
      return res.status(404).json({ error: 'Doctor not found' });
    }
    res.json({ message: 'Doctor deleted successfully', doctor: deletedDoctor.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

router.post('/add-new-doctor', async (req, res) => {
  const { name, specialization, contact_info, username, password, role } = req.body;
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await pool.query(
      'INSERT INTO users (username, password, role) VALUES ($1, $2, $3) RETURNING *',
      [username, hashedPassword, role]
    );
    const userId = newUser.rows[0].user_id;

    const newDoctor = await pool.query(
      'INSERT INTO doctors (user_id, name, specialization, contact_info) VALUES ($1, $2, $3, $4) RETURNING *',
      [userId, name, specialization, contact_info]
    );

    res.json(newDoctor.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});


module.exports = router;