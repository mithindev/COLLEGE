import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post('http://localhost:5005/api/auth/login', {
        username,
        password,
      });

      // Extract token and user details from the response
      const { token, user } = res.data;

      // Store token in localStorage or context
      localStorage.setItem('token', token);

      // Get the role from the user details
      const role = user.role;

      // Navigate based on user role
      if (role === 'Admin') {
        navigate('/admin/dashboard');
      } else if (role === 'Doctor') {
        navigate('/doctor/dashboard');
      } else if (role === 'Receptionist') {
        navigate('/receptionist/dashboard');
      } else if (role === 'Patient') {
        navigate('/patient/dashboard');
      } else {
        console.error('Unknown role:', role);
      }
    } catch (error) {
      console.error('Login failed:', error);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center">
      <form onSubmit={handleLogin} className="p-6 bg-white shadow-md rounded">
        <h2 className="text-xl font-bold mb-4">Login</h2>
        <div className="mb-4">
          <label className="block text-gray-700">Username</label>
          <input
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            className="border p-2 w-full"
            required
          />
        </div>
        <div className="mb-4">
          <label className="block text-gray-700">Password</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="border p-2 w-full"
            required
          />
        </div>
        <button
          type="submit"
          className="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600"
        >
          Login
        </button>
        <p className="mt-4 text-center">
          Don't have an account?{' '}
          <a href="/register" className="text-blue-500 underline">
            Sign up
          </a>
        </p>
      </form>
    </div>
  );
};

export default LoginPage;
