const express = require('express');
const router = express.Router();
const pool = require('../models/db');
const authenticateToken = require('../middleware/authenticateToken'); 

router.get('/me', authenticateToken, async (req, res) => {
  const userId = req.user.userId;  // Extracted from JWT by the middleware

  try {
    // Query to get patient details
    const patientDetails = await pool.query(
      `SELECT u.user_id, u.username, u.role, p.name, p.age, p.gender, p.contact_info
       FROM users u
       JOIN patients p ON u.user_id = p.user_id
       WHERE u.user_id = $1 AND u.role = 'Patient'`,
      [userId]
    );

    if (patientDetails.rows.length === 0) {
      return res.status(404).json({ error: 'Patient not found or user is not a patient' });
    }

    const patientId = patientDetails.rows[0].user_id;  // Extract the patient's ID

    // Query to get medical records
    const medicalRecords = await pool.query(
      `SELECT mr.record_id, mr.diagnosis, mr.prescription, mr.visit_date, d.name AS doctor_name
       FROM medicalrecords mr
       JOIN doctors d ON mr.doctor_id = d.doctor_id
       WHERE mr.patient_id = $1`,
      [patientId]
    );

    // Combine patient details and medical records
    res.json({
      patient: patientDetails.rows[0],
      medicalRecords: medicalRecords.rows
    });

  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});



module.exports = router;
