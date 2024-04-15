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

