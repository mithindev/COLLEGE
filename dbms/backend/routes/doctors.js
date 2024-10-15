const express = require('express');
const router = express.Router();
const pool = require('../models/db');

// Role-based middleware
function checkRole(roles) {
  return (req, res, next) => {
      if (roles.includes(req.user.role)) {
          return res.status(403).json({ message: 'Access forbidden: insufficient rights' });
      }
      next();
  };
}

// Get all patients
router.get('/get-patients', async (req, res) => {
  try {
    const patients = await pool.query('SELECT * FROM patients');
    res.json(patients.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get a specific patient by ID
router.get('/get-patient-by-id/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const patient = await pool.query('SELECT * FROM patients WHERE patient_id = $1', [id]);
    if (patient.rows.length === 0) {
      return res.status(404).json({ error: 'Patient not found' });
    }
    res.json(patient.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

// Update a patient by ID
router.put('/update-patient-by-id/:id', async (req, res) => {
  const { id } = req.params;
  const { name, age, gender, contact_info, new_history_entry } = req.body;
  
  try {
    // First, fetch the current medical history
    const patientQuery = await pool.query('SELECT medical_history FROM patients WHERE patient_id = $1', [id]);
    
    if (patientQuery.rows.length === 0) {
      return res.status(404).json({ error: 'Patient not found' });
    }

    // Append new entry to the existing medical history
    const updatedMedicalHistory = patientQuery.rows[0].medical_history
      ? `${patientQuery.rows[0].medical_history}\n${new_history_entry}`
      : new_history_entry;

    const updatedPatient = await pool.query(
      'UPDATE patients SET name = $1, age = $2, gender = $3, contact_info = $4, medical_history = $5 WHERE patient_id = $6 RETURNING *',
      [name, age, gender, contact_info, updatedMedicalHistory, id]
    );
    
    res.json(updatedPatient.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});


// Delete a patient by ID
router.delete('/delete-patient-by-id/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const deletedPatient = await pool.query('DELETE FROM patients WHERE patient_id = $1 RETURNING *', [id]);
    if (deletedPatient.rows.length === 0) {
      return res.status(404).json({ error: 'Patient not found' });
    }
    res.json({ message: 'Patient deleted successfully', patient: deletedPatient.rows[0] });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
