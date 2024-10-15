import './App.css';
import LoginPage from './pages/auth/LoginPage';
import RegisterPage from './pages/auth/RegisterPage';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';  // Import Routes and Route
import AdminDashboard from './pages/dashboard/AdminDashboard';
import ManageDoctors from '../src/components/ManageDoctors';
import ManagePatients from '../src/components/ManagePatients';
import ManageAppointments from '../src/components/ManageAppointments';
import DoctorDashboard from './pages/dashboard/DoctorDashboard';
import PatientDashboard from './pages/dashboard/PatientDashboard';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Navigate to="/login" />} />  {/* Redirect to /login */}

        <Route path="/login" element={<LoginPage />} />
        <Route path="/register" element={<RegisterPage />} />

        {/* //! Admin Pages */}
        <Route path="/admin/dashboard" element={<AdminDashboard />} />
        <Route path="/admin/doctors" element={<ManageDoctors />} />
        <Route path="/admin/patients" element={<ManagePatients />} />
        <Route path="/admin/appointments" element={<ManageAppointments />} />
        {/* Other routes */}

        {/* //! Doc Pages */}
        <Route path="/doctor/dashboard" element={<DoctorDashboard />} />

        {/* //! Patient Pages */}
        <Route path="/patient/dashboard" element={<PatientDashboard />} />

      </Routes>
    </Router>
  );
}

export default App;