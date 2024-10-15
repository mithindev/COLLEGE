const express = require('express');
const router = express.Router();
const pool = require('../models/db');

// Add a new doctor
// router.post('/', async (req, res) => {
//   const { name, specialty, contact_info } = req.body;
//   try {
//     const newDoctor = await pool.query(
//       'INSERT INTO doctors (name, specialty, contact_info) VALUES ($1, $2, $3) RETURNING *',
//       [name, specialty, contact_info]
//     );
//     res.json(newDoctor.rows[0]);
//   } catch (err) {
//     console.error(err.message);
//     res.status(500).json({ error: 'Server error' });
//   }
// });

// Get all doctors
router.get('/get-all-doctors', async (req, res) => {
  try {
    const doctors = await pool.query('SELECT * FROM doctors');
    res.json(doctors.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get a specific doctor by ID
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

// Update a doctor by ID
router.put('/update-doctor-by-id/:id', async (req, res) => {
  const { id } = req.params;
  const { name, specialty, contact_info } = req.body;
  try {
    const updatedDoctor = await pool.query(
      'UPDATE doctors SET name = $1, specialty = $2, contact_info = $3 WHERE doctor_id = $4 RETURNING *',
      [name, specialty, contact_info, id]
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

// Delete a doctor by ID
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

// Add a new doctor and corresponding user
router.post('/add-new-doctor', async (req, res) => {
  const { name, specialty, contact_info, username, password, role } = req.body;
  try {
    // Add the doctor as a user first
    const newUser = await pool.query(
      'INSERT INTO users (username, password, role) VALUES ($1, $2, $3) RETURNING user_id',
      [username, password, role]
    );
    const userId = newUser.rows[0].user_id;

    // Add the doctor to the doctors table
    const newDoctor = await pool.query(
      'INSERT INTO doctors (user_id, name, specialty, contact_info) VALUES ($1, $2, $3, $4) RETURNING *',
      [userId, name, specialty, contact_info]
    );

    res.json(newDoctor.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
