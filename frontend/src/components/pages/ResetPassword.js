import React, { useState } from 'react';
import './ForgotPassword.css'; // Adjust the import path as necessary
import axios from 'axios';
import { useLocation } from 'react-router-dom';

function ResetPassword() {
    const [password,setPassword] = useState('')
    const [error,setError] = useState('')
    const [successMessage,setSuccessMessage] = useState('')
    const [confirmPassword,setConfirmPassword] = useState('')
    const location = useLocation()
    const handleSubmit = async (event) => {
        event.preventDefault();

        try {
            if(password === confirmPassword) {
                const { data } = await axios.post('api/reset-password', { email:location.state.email,password });
                setError('')
                setSuccessMessage("Password successfully changed")
                setPassword('')
                setConfirmPassword('')
            }
            else {
                setError('Password does not match.')
            }
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
                    <h2 className='forgotformHeader'>Reset Password</h2>
                    <div className="input-group">
                        <input
                            placeholder='Enter Your Password'
                            type="password"
                            id="password"
                            name="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    <div className="input-group">
                        <input
                            placeholder='Confirm Password'
                            type="password"
                            id="password2"
                            name="password2"
                            value={confirmPassword}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            required
                        />
                    </div>
                    {error && <p className="error">{error}</p>} {/* Display error messages */}
                    {successMessage && <p className="success">{successMessage}</p>} {/* Display error messages */}
                    <button type="submit" className="forgot-button">Submit</button>
                    {/* Add the link to the signup page here */}
                </form>
            </div>
        </div>
    );
}

export default ResetPassword;