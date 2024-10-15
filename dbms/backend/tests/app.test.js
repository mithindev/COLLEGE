const request = require('supertest');
const app = require('../server'); // Adjust the path based on your file structure
const pool = require('../models/db');

escribe('Auth Routes', () => {
  it('should register a new user', async () => {
    const response = await request(app)
      .post('/api/auth/register')
      .send({ username: 'testuser', password: 'testpass', role: 'admin' });
    expect(response.statusCode).toBe(201); // Adjust based on actual API response
    expect(response.body).toHaveProperty('message', 'User registered successfully');
  });

  it('should login the user', async () => {
    const response = await request(app)
      .post('/api/auth/login')
      .send({ username: 'testuser', password: 'testpass' });
    expect(response.statusCode).toBe(200);
    expect(response.body).toHaveProperty('token'); // Check if token is returned
  });
});

describe('API Routes', () => {
  let token;

  beforeAll(async () => {
    const res = await request(app)
      .post('/api/auth/login')
      .send({
        username: 'testUser',
        password: 'testPassword'
      });
    expect(res.statusCode).toBe(200); // Ensure login succeeds before continuing
    token = res.body.token;
    expect(token).toBeDefined(); // Ensure token exists
  });

  it('should register a new user', async () => {
    const res = await request(app)
      .post('/api/auth/register')
      .send({
        username: 'newUser',
        password: 'newPassword',
        role: 'Patient'
      });
    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty('message', 'User registered successfully');
  });

  it('should get all patients', async () => {
    const res = await request(app)
      .get('/api/patients')
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toBeInstanceOf(Array);
  });

  beforeAll(async () => {
    // Register and login a user to get a token if needed
    const res = await request(app)
      .post('/api/auth/login')
      .send({
        username: 'testUser',
        password: 'testPassword'
      });
    token = res.body.token; // Assuming you get a token on successful login
  });

  // 1. Authentication Routes
  it('should register a new user', async () => {
    const res = await request(app)
      .post('/api/auth/register')
      .send({
        username: 'newUser',
        password: 'newPassword',
        role: 'Patient'
      });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('message', 'User registered successfully');
  });

  it('should login a user', async () => {
    const res = await request(app)
      .post('/api/auth/login')
      .send({
        username: 'testUser',
        password: 'testPassword'
      });
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('token');
  });

  // 2. Patient Routes
  it('should get all patients', async () => {
    const res = await request(app)
      .get('/api/patients')
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toBeInstanceOf(Array);
  });

  it('should add a new patient', async () => {
    const res = await request(app)
      .post('/api/patients')
      .set('Authorization', `Bearer ${token}`)
      .send({
        name: 'John Doe',
        age: 30,
        gender: 'Male',
        contact_info: '1234567890',
        medical_history: 'None'
      });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('message', 'Patient created successfully');
  });

  it('should get a specific patient by ID', async () => {
    const res = await request(app)
      .get('/api/patients/get-patient-by-id/1')
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('name', 'John Doe');
  });

  // 3. Doctor Routes
  it('should add a new doctor', async () => {
    const res = await request(app)
      .post('/api/doctors')
      .set('Authorization', `Bearer ${token}`)
      .send({
        name: 'Dr. Smith',
        specialization: 'Cardiology',
        contact_info: '9876543210'
      });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('message', 'Doctor created successfully');
  });

  it('should get all doctors', async () => {
    const res = await request(app)
      .get('/api/doctors/get-all-doctors')
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toBeInstanceOf(Array);
  });

  // 4. Appointment Routes
  it('should schedule an appointment', async () => {
    const res = await request(app)
      .post('/api/appointments/create-appointment')
      .set('Authorization', `Bearer ${token}`)
      .send({
        patient_id: 1,
        doctor_id: 1,
        appointment_date: '2024-10-15T10:00:00Z',
        status: 'Scheduled'
      });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('message', 'Appointment created successfully');
  });

  it('should get all appointments', async () => {
    const res = await request(app)
      .get('/api/appointments/get-all-appointments')
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toBeInstanceOf(Array);
  });
});