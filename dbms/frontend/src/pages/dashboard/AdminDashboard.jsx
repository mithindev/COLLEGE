import React from 'react';
import { useNavigate } from 'react-router-dom';

const AdminDashboard = () => {
  const navigate = useNavigate();

  const handleManageDoctors = () => {
    navigate('/admin/doctors');
  };

  const handleManagePatients = () => {
    navigate('/admin/patients');
  };

  const handleManageAppointments = () => {
    navigate('/admin/appointments');
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center">
      <h1 className="text-3xl font-bold mb-8">Admin Dashboard</h1>
      <div className="space-y-4">
        <button
          onClick={handleManageDoctors}
          className="bg-blue-500 text-white p-3 rounded hover:bg-blue-600 w-64"
        >
          Manage Doctors
        </button>
        <button
          onClick={handleManagePatients}
          className="bg-blue-500 text-white p-3 rounded hover:bg-blue-600 w-64"
        >
          Manage Patients
        </button>
        <button
          onClick={handleManageAppointments}
          className="bg-blue-500 text-white p-3 rounded hover:bg-blue-600 w-64"
        >
          Manage Appointments
        </button>
      </div>
    </div>
  );
};

export default AdminDashboard;
