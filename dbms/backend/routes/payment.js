const express = require('express');
const router = express.Router();
const pool = require('../models/db');
const authenticateToken = require('../middleware/authenticateToken'); 

router.post('/make-payment', authenticateToken, async (req, res) => {
  const { amount } = req.body;
  const patientId = req.user.userId;

  try {
    // Begin the transaction
    await pool.query('BEGIN');

    // Step 1: Insert a new payment with status 'pending'
    const paymentInsertQuery = `
      INSERT INTO Payments (patient_id, amount, status)
      VALUES ($1, $2, 'pending')
      RETURNING payment_id;
    `;
    const paymentResult = await pool.query(paymentInsertQuery, [patientId, amount]);
    const paymentId = paymentResult.rows[0].payment_id;

    // Simulate server crash or error (optional, for demonstration)
    // throw new Error('Simulating server crash...');

    // Step 2: Update the payment status to 'completed'
    const updatePaymentQuery = `
      UPDATE Payments
      SET status = 'completed'
      WHERE payment_id = $1;
    `;
    await pool.query(updatePaymentQuery, [paymentId]);

    // Commit the transaction
    await pool.query('COMMIT');
    
    res.json({ message: 'Payment successful', paymentId });

  } catch (error) {
    // Rollback transaction if anything fails
    await pool.query('ROLLBACK');
    console.error('Transaction failed: ', error.message);
    res.status(500).json({ error: 'Payment failed, transaction rolled back' });
  }
});

module.exports = router;
