import React, { useState } from 'react';
import './Login.css';
import {Link, useNavigate} from "react-router-dom";
import {useAuth} from "../context/AuthContext"; // Adjust the import path as necessary
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
            console.log(data , "data here")
            login(data.token,data?.user); // Update the login state and localStorage with the token
            navigate('/'); // Redirect to the homepage or dashboard after successful login
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
                    <h2 className='formHeader'>Login</h2>
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
                    <button type="submit" className="login-button">Submit</button>
                    {/* Add the link to the signup page here */}
                    <div className="signup-link">
                        Don't have an account? <Link to="/sign-up">Sign up</Link>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Login;

            /*
import React, { useState } from 'react';
import './Login.css';
import {useNavigate} from "react-router-dom";
import {useAuth} from "../context/AuthContext"; // Make sure to create a corresponding CSS file for styling
import axios from 'axios';

function Login() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();
    const { login } = useAuth(); // Use the login function from your AuthContext
    const [error, setError] = useState('');


    const handleSubmit = async (event) => {
        event.preventDefault();

        try {
            const { data } = await axios.post('/api/login', { username, password });
            login(data.token); // Use the login function from context to update state and localStorage
            navigate('/'); // Redirect to home page or dashboard as needed
        } catch (error) {
            if (error.response && error.response.data) {
                setError(error.response.data.message); // Assuming the server sends back a detailed error message
            } else {
                setError('Login failed. Please try again.');
            }
            console.error('Login Failed:', error);
        }
    };

    return (
        <div className="login-container">
            <form className="login-form" onSubmit={handleSubmit}>
                <h2>Login</h2>
                <div className="input-group">
                    <label htmlFor="username">Username</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                    />
                </div>
                <div className="input-group">
                    <label htmlFor="password">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                    />
                </div>
                <button type="submit" className="login-button">Login</button>
            </form>
        </div>
    );
}

export default Login;

        */