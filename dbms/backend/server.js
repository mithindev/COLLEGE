const express = require('express');
const app = express();
require('dotenv').config();

// Middleware to parse JSON bodies
app.use(express.json());

// Import the routes
const authRoutes = require('./routes/auth');       // Authentication routes
const patientRoutes = require('./routes/patients'); // Patient routes
const doctorRoutes = require('./routes/doctors');   // Doctor routes
const appointmentRoutes = require('./routes/appointments'); 
const adminRoutes = require('./routes/admin'); 

// Basic route for health check
const cors = require('cors');
app.use(cors({ origin: 'http://localhost:5173' }));

app.get('/', (req, res) => {
  res.send('Hospital Management API is running');
});

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/patient', patientRoutes); 
app.use('/api/doctors', doctorRoutes); 
app.use('/api/appointments', appointmentRoutes);
app.use('/api/admin', adminRoutes);

// Start the server
if (process.env.NODE_ENV !== 'test') {
  const PORT = process.env.PORT || 5005;
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
}

module.exports = app;
