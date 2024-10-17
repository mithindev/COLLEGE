import React, { useEffect, useState } from 'react';
import axios from 'axios';

const PatientDashboard = () => {
  const [patientData, setPatientData] = useState({
    user_id: '',
    username: '',
    role: '',
    name: '',
    age: '',
    gender: '',
    contact_info: '',
  });
  const [medicalRecords, setMedicalRecords] = useState([]);
  const [amount, setAmount] = useState('');
  const [message, setMessage] = useState('');

  const handlePayment = async () => {
    try {
      const response = await axios.post('http://localhost:5005/api/patient/make-payment', 
        { amount },
        { headers: { Authorization: `Bearer ${localStorage.getItem('token')}` } }
      );
      setMessage(response.data.message);
    } catch (error) {
      setMessage('Payment failed');
      console.error('Payment error:', error);
    }
  };

  const fetchPatientData = async () => {
    try {
      const response = await axios.get('http://localhost:5005/api/patient/me', {
        headers: { Authorization: `Bearer ${localStorage.getItem('token')}` },
      });

      setPatientData(response.data.patient);
      setMedicalRecords(response.data.medicalRecords);
    } catch (error) {
      console.error('Error fetching patient details and medical records:', error);
    }
  };

  useEffect(() => {
    fetchPatientData();
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-2xl font-bold mb-4">Patient Dashboard</h2>

      <div className="mb-6">
        <h3 className="text-xl font-semibold">Patient Details</h3>
        <p><strong>Name:</strong> {patientData.name}</p>
        <p><strong>Age:</strong> {patientData.age}</p>
        <p><strong>Gender:</strong> {patientData.gender}</p>
        <p><strong>Contact Info:</strong> {patientData.contact_info}</p>
      </div>

      <div>
        <h3 className="text-xl font-semibold">Medical Records</h3>
        {medicalRecords.length > 0 ? (
          <ul className="list-disc pl-5">
            {medicalRecords.map(record => (
              <li key={record.record_id} className="mb-4">
                <p><strong>Diagnosis:</strong> {record.diagnosis}</p>
                <p><strong>Prescription:</strong> {record.prescription}</p>
                <p><strong>Visit Date:</strong> {new Date(record.visit_date).toLocaleDateString()}</p>
                <p><strong>Doctor:</strong> {record.doctor_name}</p>
              </li>
            ))}
          </ul>
        ) : (
          <p>No medical records found.</p>
        )}

      <div className="p-4">
            <h2 className="text-2xl font-bold mb-4">Patient Dashboard</h2>

            {/* Payment Form */}
            <div className="mb-6">
              <h3 className="text-xl font-semibold">Make a Payment</h3>
              <input
                type="number"
                className="border rounded p-2 mb-2"
                placeholder="Enter amount"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
              />
              <button
                onClick={handlePayment}
                className="bg-blue-500 text-white px-4 py-2 rounded"
              >
                Pay
              </button>
              {message && <p className="mt-4">{message}</p>}
            </div>
          </div>
      </div>
    </div>
  );
};

export default PatientDashboard;
