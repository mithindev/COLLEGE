const express = require('express');
const router = express.Router();
const pool = require('../models/db');
const authenticateToken = require('../middleware/authenticateToken'); 

// Route to get patient details
router.get('/me', authenticateToken, async (req, res) => {
  const userId = req.user.user_id;  // Extracted from JWT by the middleware

  try {
    // Query to fetch patient details by joining users and patients tables
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

    res.json(patientDetails.rows[0]);  // Return the first (and only) result
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
