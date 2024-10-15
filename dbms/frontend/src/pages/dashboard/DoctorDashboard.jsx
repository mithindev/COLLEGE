import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const DoctorDashboard = () => {
  const [patients, setPatients] = useState([]);
  const [selectedPatient, setSelectedPatient] = useState(null);
  const [patientDetails, setPatientDetails] = useState({
    name: '',
    age: '',
    gender: '',
    contact_info: '',
    medical_history: '',
  });
  const [newHistoryEntry, setNewHistoryEntry] = useState(''); // For appending medical history
  const [isEditing, setIsEditing] = useState(false); // Editing mode toggle
  const navigate = useNavigate();

  useEffect(() => {
    fetchPatients();
  }, []);

  const fetchPatients = async () => {
    try {
      const response = await fetch('http://localhost:5005/api/doctors/get-patients');
      const data = await response.json();
      setPatients(data);
    } catch (error) {
      console.error('Error fetching patients:', error);
    }
  };

  const handleSelectPatient = (patient) => {
    setSelectedPatient(patient);
    setPatientDetails({
      name: patient.name,
      age: patient.age,
      gender: patient.gender,
      contact_info: patient.contact_info,
      medical_history: patient.medical_history || '',
    });
    setIsEditing(false); // Reset editing mode when selecting a new patient
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setPatientDetails({ ...patientDetails, [name]: value });
  };

  const handleUpdatePatient = async () => {
    try {
      const response = await fetch(`http://localhost:5005/api/doctors/update-patient-by-id/${selectedPatient.patient_id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...patientDetails,
          new_history_entry: newHistoryEntry, // Send new history entry to be appended
        }),
      });

      if (response.ok) {
        const updatedPatient = await response.json();
        setSelectedPatient(updatedPatient); // Update patient details in the UI
        setNewHistoryEntry(''); // Clear the history input
        setIsEditing(false); // Turn off editing mode
      } else {
        console.error('Failed to update patient');
      }
    } catch (error) {
      console.error('Error updating patient:', error);
    }
  };

  return (
    <div className="min-h-screen p-8">
      <h1 className="text-3xl font-bold mb-8">Doctor Dashboard</h1>

      <div className="grid grid-cols-2 gap-8">
        <div className="space-y-4">
          <h2 className="text-xl font-semibold">Patients</h2>
          <ul>
            {patients.map((patient) => (
              <li
                key={patient.patient_id}
                className="p-4 bg-gray-100 rounded mb-2 cursor-pointer"
                onClick={() => handleSelectPatient(patient)}
              >
                {patient.name} - {patient.age} years old
              </li>
            ))}
          </ul>
        </div>

        {selectedPatient && (
          <div className="space-y-4">
            <h2 className="text-xl font-semibold">Patient Details</h2>
            <div className="space-y-2">
              <label>
                <strong>Name:</strong>
                <input
                  type="text"
                  name="name"
                  value={patientDetails.name}
                  onChange={handleInputChange}
                  className="border p-2 w-full"
                  disabled={!isEditing}
                />
              </label>
              <label>
                <strong>Age:</strong>
                <input
                  type="number"
                  name="age"
                  value={patientDetails.age}
                  onChange={handleInputChange}
                  className="border p-2 w-full"
                  disabled={!isEditing}
                />
              </label>
              <label>
                <strong>Gender:</strong>
                <input
                  type="text"
                  name="gender"
                  value={patientDetails.gender}
                  onChange={handleInputChange}
                  className="border p-2 w-full"
                  disabled={!isEditing}
                />
              </label>
              <label>
                <strong>Contact Info:</strong>
                <input
                  type="text"
                  name="contact_info"
                  value={patientDetails.contact_info}
                  onChange={handleInputChange}
                  className="border p-2 w-full"
                  disabled={!isEditing}
                />
              </label>
              <div className="space-y-2">
                <h3 className="font-bold">Medical History</h3>
                <textarea
                  value={patientDetails.medical_history}
                  readOnly
                  className="w-full p-2 border"
                  rows="5"
                />
              </div>

              {/* Edit Button to Enable Adding History */}
              <button
                className="bg-blue-500 text-white p-2 rounded mt-2 hover:bg-blue-600"
                onClick={() => setIsEditing(true)}
              >
                Edit Patient Details
              </button>

              {/* Append to Medical History */}
              {isEditing && (
                <div className="mt-4">
                  <textarea
                    className="border p-2 w-full"
                    rows="4"
                    placeholder="Add new medical history entry"
                    value={newHistoryEntry}
                    onChange={(e) => setNewHistoryEntry(e.target.value)}
                  ></textarea>
                  <button
                    onClick={handleUpdatePatient}
                    className="bg-green-500 text-white p-2 rounded mt-2 hover:bg-green-600"
                  >
                    Append to History
                  </button>
                </div>
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default DoctorDashboard;
