import React, { useState, useEffect, useContext } from 'react';
import { AuthContext } from '../context/AuthContext';
import axios from 'axios';
import './Profile.css'

function Profile() {
    const { user } = useContext(AuthContext); // Assuming your AuthContext provides the logged in user's data
    const [profile, setProfile] = useState({});
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);


    useEffect(() => {
        const fetchProfile = async () => {
            setIsLoading(true);
            try {
                const response = await axios.get(`/api/users/${user.userId}`, {
                    headers: {
                        'Authorization': `Bearer ${localStorage.getItem('token')}`
                    }
                });
                setProfile(response.data);
            } catch (error) {
                console.error('Error fetching profile:', error);
                setError(error.message);
            } finally {
                setIsLoading(false);
            }
        };

        if (user && user.userId) { // Ensure userId is available
            fetchProfile();
        }
    }, [user]);

    // While loading/error
    if (isLoading) return <div>Loading profile...</div>;
    if (error) return <div>Error: {error}</div>;



    return (
        <div className="profile-container">
            <div className="profile-header">
                {/* Profile Image */}
                <div className="profile-image-container">
                    <img src="/profile%20picture.jpeg" alt="Profile" />
                </div>
                {/* Profile Details */}
                <div className="profile-details">
                    <div>
                        <label htmlFor="username">Username: </label>
                        <input
                            type="text"
                            id="username"
                            value={profile.username}
                            onChange={(e) => setProfile({ ...profile, username: e.target.value })}
                        />
                    </div>
                    <div>
                        <label htmlFor="email">Email: </label>
                        <input
                            type="email"
                            id="email"
                            value={profile.email}
                            onChange={(e) => setProfile({ ...profile, email: e.target.value })}
                        />
                    </div>
                    {/* Add more form fields as needed */}
                </div>
            </div>
            {/* Add other sections as needed */}
        </div>
    );
}

export default Profile;

/*

import React, { useState, useContext, useEffect } from 'react';
import { AuthContext } from '../context/AuthContext';
import axios from 'axios';
import './Profile.css'
function Profile() {
    const { user } = useContext(AuthContext);
    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [message, setMessage] = useState('');

    useEffect(() => {
        if (user) {
            setUsername(user.username);
            setEmail(user.email);
        }
    }, [user]);



    const handleUpdate = async () => {
        try {
            // Assuming you have an endpoint to update user settings
            const response = await axios.put(`/api/users/${user.userId}/profile`, {
                username,
                email
            });
            setMessage(response.data.message);
        } catch (error) {
            setMessage('Failed to update settings. Please try again.');
            console.error('Error updating settings:', error);
        }
    };

    return (
        <div className="profile-container">
            <h1>Profile</h1>
            {message && <p>{message}</p>}
            <div className="form-group">
                <label htmlFor="username">Username:</label>
                <input
                    type="text"
                    id="username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                />
            </div>
            <div className="form-group">
                <label htmlFor="email">Email:</label>
                <input
                    type="email"
                    id="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                />
            </div>
            <button onClick={handleUpdate}>Update Profile</button>
        </div>
    );
}

export default Profile;
*/;