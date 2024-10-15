import React, { useEffect, useState } from 'react';
import axios from 'axios';

const ManageDoctors = () => {
  const [doctors, setDoctors] = useState([]);
  const [newDoctor, setNewDoctor] = useState({
    name: '',
    specialization: '',
    contact_info: '',
    username: '',
    password: '',
    role: 'Doctor',
  });
  const [editingDoctor, setEditingDoctor] = useState(null);

  // Fetch all doctors on component mount
  useEffect(() => {
    const fetchDoctors = async () => {
      try {
        const response = await axios.get('http://localhost:5005/api/admin/get-all-doctors');
        setDoctors(response.data);
      } catch (error) {
        console.error('Error fetching doctors:', error);
      }
    };
    fetchDoctors();
  }, []);

  // Add a new doctor
  const handleAddDoctor = async () => {
    try {
      const response = await axios.post('http://localhost:5005/api/admin/add-new-doctor', newDoctor);
      setDoctors([...doctors, response.data]); // Update the list with the new doctor
      setNewDoctor({
        name: '',
        specialization: '',
        contact_info: '',
        username: '',
        password: '',
        role: 'Doctor',
      }); // Reset form
    } catch (error) {
      console.error('Error adding doctor:', error);
    }
  };

  // Update an existing doctor
  const handleUpdateDoctor = async (doctorId) => {
    try {
      const response = await axios.put(`http://localhost:5005/api/admin/update-doctor-by-id/${doctorId}`, editingDoctor);
      setDoctors(doctors.map((doctor) => (doctor.doctor_id === doctorId ? response.data : doctor))); // Update the list
      setEditingDoctor(null); // Exit editing mode
    } catch (error) {
      console.error('Error updating doctor:', error);
    }
  };
   
  // Remove a doctor
  const handleRemoveDoctor = async (doctorId) => {
    try {
      await axios.delete(`http://localhost:5005/api/admin/delete-doctor-by-id/${doctorId}`);
      setDoctors(doctors.filter((doctor) => doctor.doctor_id !== doctorId)); // Remove from list
    } catch (error) {
      console.error('Error removing doctor:', error);
    }
  };

  return (
    <div className="p-6">
      <h2 className="text-2xl font-bold mb-4">Manage Doctors</h2>

      {/* Form for adding new doctor */}
      <div className="mb-4">
        <h3 className="text-xl mb-2">Add New Doctor</h3>
        <input
          type="text"
          className="border p-2 mb-2"
          placeholder="Name"
          value={newDoctor.name}
          onChange={(e) => setNewDoctor({ ...newDoctor, name: e.target.value })}
        />
        <input
          type="text"
          className="border p-2 mb-2"
          placeholder="specialization"
          value={newDoctor.specialization}
          onChange={(e) => setNewDoctor({ ...newDoctor, specialization: e.target.value })}
        />
        <input
          type="text"
          className="border p-2 mb-2"
          placeholder="Contact Info"
          value={newDoctor.contact_info}
          onChange={(e) => setNewDoctor({ ...newDoctor, contact_info: e.target.value })}
        />
        <input
          type="text"
          className="border p-2 mb-2"
          placeholder="Username"
          value={newDoctor.username}
          onChange={(e) => setNewDoctor({ ...newDoctor, username: e.target.value })}
        />
        <input
          type="password"
          className="border p-2 mb-2"
          placeholder="Password"
          value={newDoctor.password}
          onChange={(e) => setNewDoctor({ ...newDoctor, password: e.target.value })}
        />
        <button className="bg-blue-500 text-white px-4 py-2" onClick={handleAddDoctor}>
          Add Doctor
        </button>
      </div>

      {/* Doctors table */}
      <table className="min-w-full">
        <thead>
          <tr>
            <th>Name</th>
            <th>specialization</th>
            <th>Contact Info</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {doctors.map((doctor) => (
            <tr key={doctor.doctor_id}>
              <td>
                {editingDoctor && editingDoctor.doctor_id === doctor.doctor_id ? (
                  <input
                    type="text"
                    className="border p-2"
                    value={editingDoctor.name}
                    onChange={(e) => setEditingDoctor({ ...editingDoctor, name: e.target.value })}
                  />
                ) : (
                  doctor.name
                )}
              </td>
              <td>
                {editingDoctor && editingDoctor.doctor_id === doctor.doctor_id ? (
                  <input
                    type="text"x
                    className="border p-2"
                    value={editingDoctor.specialization}
                    onChange={(e) => setEditingDoctor({ ...editingDoctor, specialization: e.target.value })}
                  />
                ) : (
                  doctor.specialization
                )}
              </td>
              <td>
                {editingDoctor && editingDoctor.doctor_id === doctor.doctor_id ? (
                  <input
                    type="text"
                    className="border p-2"
                    value={editingDoctor.contact_info}
                    onChange={(e) => setEditingDoctor({ ...editingDoctor, contact_info: e.target.value })}
                  />
                ) : (
                  doctor.contact_info
                )}
              </td>
              <td>
                {editingDoctor && editingDoctor.doctor_id === doctor.doctor_id ? (
                  <>
                    <button
                      className="bg-green-500 text-white px-4 py-2 mr-2"
                      onClick={() => handleUpdateDoctor(doctor.doctor_id)}
                    >
                      Save
                    </button>
                    <button className="bg-gray-500 text-white px-4 py-2" onClick={() => setEditingDoctor(null)}>
                      Cancel
                    </button>
                  </>
                ) : (
                  <>
                    <button
                      className="bg-yellow-500 text-white px-4 py-2 mr-2"
                      onClick={() => setEditingDoctor(doctor)}
                    >
                      Edit
                    </button>
                    <button
                      className="bg-red-500 text-white px-4 py-2"
                      onClick={() => handleRemoveDoctor(doctor.doctor_id)}
                    >
                      Delete
                    </button>
                  </>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ManageDoctors;
