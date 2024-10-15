import React, { useEffect, useState } from 'react';
import axios from 'axios';

const PatientDashboard = () => {
  const [patientDetails, setPatientDetails] = useState(null);  // State to store patient details
  const token = localStorage.getItem('token');  // Assuming the token is stored in local storage

  useEffect(() => {
    const fetchPatientDetails = async () => {
      try {
        const response = await axios.get('http://localhost:5005/api/patient/me', {
          headers: {
            Authorization: `Bearer ${token}`  // Sending the JWT token in headers
          }
        });
        setPatientDetails(response.data);  // Store the fetched patient details
      } catch (error) {
        console.error('Error fetching patient details:', error);
      }
    };

    fetchPatientDetails();
  }, [token]);

  if (!patientDetails) {
    return <div>Loading...</div>;  // Display loading until the data is fetched
  }

  return (
    <div className="min-h-screen flex flex-col items-center justify-center">
      <div className="bg-white p-6 rounded shadow-md w-full max-w-lg">
        <h2 className="text-2xl font-bold mb-4">Patient Dashboard</h2>
        <p><strong>Name:</strong> {patientDetails.name}</p>
        <p><strong>Username:</strong> {patientDetails.username}</p>
        <p><strong>Age:</strong> {patientDetails.age}</p>
        <p><strong>Gender:</strong> {patientDetails.gender}</p>
        <p><strong>Contact Info:</strong> {patientDetails.contact_info}</p>
        <p><strong>Role:</strong> {patientDetails.role}</p>
      </div>
    </div>
  );
};

export default PatientDashboard;
