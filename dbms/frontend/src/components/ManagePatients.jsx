import React, { useEffect, useState } from 'react';
import axios from 'axios';

const ManagePatients = () => {
  const [patients, setPatients] = useState([]);
  const [selectedPatient, setSelectedPatient] = useState(null);
  const [formData, setFormData] = useState({
    name: '',
    age: '',
    gender: '',
    contact_info: '',
    new_history_entry: ''
  });

  useEffect(() => {
    fetchPatients();
  }, []);

  const fetchPatients = async () => {
    try {
      const response = await axios.get('http://localhost:5005/api/admin/get-patients');
      setPatients(response.data);
    } catch (error) {
      console.error('Error fetching patients:', error);
    }
  };

  const fetchPatientById = async (id) => {
    try {
      const response = await axios.get(`http://localhost:5005/api/admin/get-patient-by-id/${id}`);
      setSelectedPatient(response.data);
      setFormData({
        name: response.data.name,
        age: response.data.age,
        gender: response.data.gender,
        contact_info: response.data.contact_info,
        new_history_entry: ''
      });
    } catch (error) {
      console.error('Error fetching patient:', error);
    }
  };

  const updatePatient = async (id) => {
    try {
      await axios.put(`http://localhost:5005/api/admin/update-patient-by-id/${id}`, formData);
      fetchPatients();
      setSelectedPatient(null);
      alert('Patient updated successfully');
    } catch (error) {
      console.error('Error updating patient:', error);
    }
  };

  const deletePatient = async (id) => {
    try {
      await axios.delete(`http://localhost:5005/api/admin/delete-patient-by-id/${id}`);
      fetchPatients();
      alert('Patient deleted successfully');
    } catch (error) {
      console.error('Error deleting patient:', error);
    }
  };

  return (
    <div className="container mx-auto p-6">
      <h1 className="text-2xl font-bold mb-4">Manage Patients</h1>

      {/* Patients List */}
      <div className="mb-6">
        <h2 className="text-xl font-semibold mb-3">All Patients</h2>
        <table className="min-w-full table-auto bg-white shadow-md rounded-lg">
          <thead className="bg-gray-100">
            <tr>
              <th className="px-4 py-2">ID</th>
              <th className="px-4 py-2">Name</th>
              <th className="px-4 py-2">Age</th>
              <th className="px-4 py-2">Gender</th>
              <th className="px-4 py-2">Actions</th>
            </tr>
          </thead>
          <tbody>
            {patients.map((patient) => (
              <tr key={patient.patient_id} className="border-t">
                <td className="px-4 py-2">{patient.patient_id}</td>
                <td className="px-4 py-2">{patient.name}</td>
                <td className="px-4 py-2">{patient.age}</td>
                <td className="px-4 py-2">{patient.gender}</td>
                <td className="px-4 py-2">
                  <button
                    className="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 mr-2"
                    onClick={() => fetchPatientById(patient.patient_id)}
                  >
                    Edit
                  </button>
                  <button
                    className="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
                    onClick={() => deletePatient(patient.patient_id)}
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Edit Patient Form */}
      {selectedPatient && (
        <div className="bg-gray-100 p-6 rounded-lg shadow-md">
          <h2 className="text-xl font-semibold mb-4">Edit Patient</h2>
          <form
            onSubmit={(e) => {
              e.preventDefault();
              updatePatient(selectedPatient.patient_id);
            }}
          >
            <div className="mb-4">
              <label className="block text-gray-700 mb-2">Name</label>
              <input
                type="text"
                className="w-full p-2 border border-gray-300 rounded"
                value={formData.name}
                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 mb-2">Age</label>
              <input
                type="number"
                className="w-full p-2 border border-gray-300 rounded"
                value={formData.age}
                onChange={(e) => setFormData({ ...formData, age: e.target.value })}
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 mb-2">Gender</label>
              <input
                type="text"
                className="w-full p-2 border border-gray-300 rounded"
                value={formData.gender}
                onChange={(e) => setFormData({ ...formData, gender: e.target.value })}
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 mb-2">Contact Info</label>
              <input
                type="text"
                className="w-full p-2 border border-gray-300 rounded"
                value={formData.contact_info}
                onChange={(e) => setFormData({ ...formData, contact_info: e.target.value })}
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700 mb-2">New Medical History Entry</label>
              <textarea
                className="w-full p-2 border border-gray-300 rounded"
                value={formData.new_history_entry}
                onChange={(e) => setFormData({ ...formData, new_history_entry: e.target.value })}
              />
            </div>
            <button
              type="submit"
              className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600"
            >
              Update Patient
            </button>
          </form>
        </div>
      )}
    </div>
  );
};

export default ManagePatients;
