import React, { useState } from 'react';
import './ForgotPassword.css'; // Adjust the import path as necessary
import axios from 'axios';
import { useNavigate } from 'react-router-dom';


function ForgotPassword() {
    const [email,setEmail] = useState('')
    const [error,setError] = useState('')
    const navigate = useNavigate();
    const handleSubmit = async (event) => {
        event.preventDefault();

        try {
            const { data } = await axios.post('api/forgot-password', { email });
            navigate('/reset-password',{state :{email}})
        } catch (error) {
            if (error.response && error.response.data) {
                setError(error.response.data.message); // Use server's error message
            } else {
                setError('Email failed. Please try again.'); // Generic error message
            }
            console.error('Login Failed:', error);
        }
    };

    return (
        <div className='ForgotPage'>
            <div className="forgot-container">
                <form className="forgot-form" onSubmit={handleSubmit}>
                    <h2 className='forgotformHeader'>Forgot Password</h2>
                    <div className="input-group">
                        <input
                            placeholder='Enter Your Email'
                            type="email"
                            id="email"
                            name="email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                        />
                    </div>
                    {error && <p className="error">{error}</p>} {/* Display error messages */}
                    <button type="submit" className="forgot-button">Submit</button>
                    {/* Add the link to the signup page here */}
                </form>
            </div>
        </div>
    );
}

export default ForgotPassword;