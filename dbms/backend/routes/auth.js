const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const pool = require('../models/db');
const router = express.Router();

// Register a user
router.post('/register', async (req, res) => {
  const { username, password, role, name, age, gender, contact_info } = req.body;

  try {
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert into the Users table
    const newUser = await pool.query(
      'INSERT INTO users (username, password, role, name) VALUES ($1, $2, $3, $4) RETURNING *',
      [username, hashedPassword, role, name]
    );

    // If the role is 'Patient', also insert into the Patients table
    if (role === 'Patient') {
      const userId = newUser.rows[0].user_id;

      await pool.query(
        'INSERT INTO patients (user_id, name, age, gender, contact_info) VALUES ($1, $2, $3, $4, $5)',
        [userId, name, age, gender, contact_info]
      );
    }

    res.json(newUser.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});



// Login a user
router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const user = await pool.query('SELECT * FROM users WHERE username = $1', [username]);

    if (!user.rows.length) {
      return res.status(400).json({ error: 'Invalid credentials' });
    }

    const isMatch = await bcrypt.compare(password, user.rows[0].password);

    if (!isMatch) {
      return res.status(400).json({ error: 'Invalid credentials' });
    }

    const token = jwt.sign({ userId: user.rows[0].user_id, role: user.rows[0].role }, process.env.JWT_SECRET, {
      expiresIn: '1h'
    });

    const userDetails = {
      userId: user.rows[0].user_id,
      username: user.rows[0].username,
      role: user.rows[0].role
    };

    // Return the token along with user details
    res.json({
      token,
      user: userDetails
    });
    
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
