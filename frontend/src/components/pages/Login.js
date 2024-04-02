import React, { useState } from 'react';
import './Login.css';
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext"; // Adjust the import path as necessary
import axios from 'axios';

function Login() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();
    const { login } = useAuth(); // Use useContext to access login function
    const [error, setError] = useState('');

    const handleSubmit = async (event) => {
        event.preventDefault();
        try {
            // Adjust the endpoint if your server configuration requires
            const { data } = await axios.post('api/login', { username, password });
            console.log(data, "data here")
            login(data.token, data?.user); // Update the login state and localStorage with the token
            localStorage.setItem('role', data.user.role);


            // Redirect based on the role
            // Ensure your API response includes the role
            if (data?.user?.role === 'admin') {
                navigate('/admin/dashboard'); // Redirect to the admin dashboard
            } else {
                navigate('/'); // Redirect to the homepage or user-specific dashboard
            }
        } catch (error) {
            // Handle error response from the server
            if (error.response && error.response.data) {
                setError(error.response.data.message); // Use server's error message
            } else {
                setError('Login failed. Please try again.'); // Generic error message
            }
            console.error('Login Failed:', error);
        }
    };

    return (
        <div className='loginPage'>
            <div className="login-container">
                {error && <p className="error">{error}</p>} {/* Display error messages */}
                <form className="login-form" onSubmit={handleSubmit}>
                    <h2 className='formHeader'>Sign In</h2>
                    <div className="input-group">
                        <input
                            placeholder='Enter User Name'
                            type="text"
                            id="username"
                            name="username"
                            value={username}
                            onChange={(e) => setUsername(e.target.value)}
                            required
                        />
                    </div>
                    <div className="input-group">
                        <input
                            placeholder='Enter Password'
                            type="password"
                            id="password"
                            name="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    <Link style={{ width: "100%", marginBottom: "5px" }} to="/forgot-password">Forgot Password?</Link>
                    <button type="submit" className="login-button">Submit</button>
                    <div className="signup-link">
                        Don't have an account? <Link to="/sign-up">Sign up</Link>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Login;
