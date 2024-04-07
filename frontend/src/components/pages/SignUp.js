import React, { useState } from 'react';
import './SignUp.css';
import {Link, useNavigate} from "react-router-dom";
import axios from 'axios';
import {useAuth} from "../context/AuthContext";
function SignUp() {
    const navigate = useNavigate();
    const {login} = useAuth();
    const [error, setError] = useState('');
    const [formData, setFormData] = useState({
        username: '',
        email: '',
        password: '',
    });
    const handleChange = (event) => {
        const { name, value } = event.target;
        setFormData(prevFormData => ({
            ...prevFormData,
            [name]: value,
        }));
    };
    const handleSubmit = async (event) => {
        event.preventDefault();
        try {
            const { data } = await axios.post('/api/signup', JSON.stringify({...formData}));
            login('token', data.token); // Assuming your server responds with a token
            navigate('/'); // Redirect to home page
        } catch (error) {
            setError('Signup failed. Please try again.');
            console.log('Signup Failed:', error);
        }
    };

    return (
        <div className='SignupPage'>
            <div className="signup-container">
                <h2 className='formHeader'>Sign Up</h2>
                <form className="signup-form" onSubmit={handleSubmit}>
                    <div className="form-group">
                        <input
                            placeholder='Enter User Name'
                            type="text"
                            id="username"
                            name="username"
                            value={formData.username}
                            onChange={handleChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <input
                            placeholder='Enter Email'
                            type="email"
                            id="email"
                            name="email"
                            value={formData.email}
                            onChange={handleChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <input
                            placeholder='Enter Password'
                            type="password"
                            id="password"
                            name="password"
                            value={formData.password}
                            onChange={handleChange}
                            required
                        />
                    </div>
                    {error && <p className="error">{error}</p>}
                    <button type="submit" className="signup-button">Submit</button>


                    <div className="GDPR-link">
                        By signing up to StudyHub, you agree to our <Link to="/GDPR">Privacy Policy.</Link>
                    </div>

                </form>
            </div>
        </div>
    );
}

export default SignUp;


/*
import React, { useState } from 'react';
import './SignUp.css';
import {useNavigate} from "react-router-dom"; // Make sure to create a corresponding CSS file for styling axios from 'axios';
import axios from 'axios';


function SignUp() {
    const navigate = useNavigate();
    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    const [formData, setFormData] = useState({
        username: '',
        email: '',
        password: '',
    });

// In your try-catch block


    const handleChange = (event) => {
        const { name, value } = event.target;
        setFormData(prevFormData => ({
            ...prevFormData,
            [name]: value,
        }));
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        // Here you would handle the signup logic, perhaps sending a request to your server
        try {
            const { data } = await axios.post('/api/signup', { username, email, password });
            localStorage.setItem('token', data.token); // Save token
            navigate('/'); // Redirect to home page
        } catch (error) {
            if (error.response && error.response.data) {
                // Assuming the server responds with an error message under `data.message`
                setError(error.response.data.message);
            } else {
                setError('Signup failed. Please try again.');
            }
            console.error('Signup Failed:', error);
        }
    };

    return (
        <div className="signup-container">
            {error && <p className="error">{error}</p>}
            <h2>Sign Up</h2>
            <form className="signup-form" onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="username">Username</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        value={formData.username}
                        onChange={handleChange}
                        required
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="email">Email</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        value={formData.email}
                        onChange={handleChange}
                        required
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        value={formData.password}
                        onChange={handleChange}
                        required
                    />
                </div>
                <button type="submit" className="signup-button">Sign Up</button>
            </form>

        </div>

    );
}

export default SignUp; */