import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const DoctorDashboard = () => {
  const [patients, setPatients] = useState([]);
  const [selectedPatient, setSelectedPatient] = useState(null);
  const [newHistoryEntry, setNewHistoryEntry] = useState('');
  const navigate = useNavigate();

  // Fetch patients list on component mount
  useEffect(() => {
    fetchPatients();
  }, []);

  const fetchPatients = async () => {
    try {
      const response = await fetch('/api/doctors/patients');
      const data = await response.json();
      setPatients(data);
    } catch (error) {
      console.error('Error fetching patients:', error);
    }
  };

  const handleSelectPatient = (patient) => {
    setSelectedPatient(patient);
  };

  const handleAppendHistory = async () => {
    if (!newHistoryEntry.trim()) return;

    try {
      const response = await fetch(`/api/patients/${selectedPatient.id}/history`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ entry: newHistoryEntry }),
      });

      if (response.ok) {
        const updatedPatient = await response.json();
        setSelectedPatient(updatedPatient); // Update the patient details with the new history
        setNewHistoryEntry(''); // Clear the input
      }
    } catch (error) {
      console.error('Error appending history:', error);
    }
  };

  return (
    <div className="min-h-screen p-8">
      <h1 className="text-3xl font-bold mb-8">Doctor Dashboard</h1>

      <div className="grid grid-cols-2 gap-8">
        {/* Patient List */}
        <div className="space-y-4">
          <h2 className="text-xl font-semibold">Patients</h2>
          <ul>
            {patients.map((patient) => (
              <li
                key={patient.id}
                className="p-4 bg-gray-100 rounded mb-2 cursor-pointer"
                onClick={() => handleSelectPatient(patient)}
              >
                {patient.name} - {patient.age} years old
              </li>
            ))}
          </ul>
        </div>

        {/* Patient Details */}
        {selectedPatient && (
          <div className="space-y-4">
            <h2 className="text-xl font-semibold">Patient Details</h2>
            <p>
              <strong>Name:</strong> {selectedPatient.name}
            </p>
            <p>
              <strong>Age:</strong> {selectedPatient.age}
            </p>
            <p>
              <strong>Gender:</strong> {selectedPatient.gender}
            </p>
            <p>
              <strong>Contact:</strong> {selectedPatient.contact}
            </p>

            <div className="space-y-2">
              <h3 className="font-bold">Medical History</h3>
              <ul className="list-disc ml-6">
                {selectedPatient.medicalHistory.map((entry, index) => (
                  <li key={index}>{entry}</li>
                ))}
              </ul>
            </div>

            {/* Append to Medical History */}
            <div className="mt-4">
              <textarea
                className="border p-2 w-full"
                rows="4"
                placeholder="Add new medical history entry"
                value={newHistoryEntry}
                onChange={(e) => setNewHistoryEntry(e.target.value)}
              ></textarea>
              <button
                onClick={handleAppendHistory}
                className="bg-green-500 text-white p-2 rounded mt-2 hover:bg-green-600"
              >
                Append to History
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default DoctorDashboard;
