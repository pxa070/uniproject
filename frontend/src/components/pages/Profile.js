import React, { useContext, useEffect, useState } from 'react';
import { AuthContext } from '../context/AuthContext';
import axios from 'axios';
import './Profile.css';

function Profile() {
    const { user } = useContext(AuthContext);
    const [isUpdating, setIsUpdating] = useState(false);
    const [isLoading,setIsLoading] = useState(false);
    const [profile, setProfile] = useState({ username: "", email: "", profile: "/Default1.jpeg" });
    const [file, setFile] = useState(null);
    const [currentPassword, setCurrentPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [passwordError, setPasswordError] = useState('');



    useEffect(() => {
        console.log(user.image_url ? `http://localhost:3001/${user.image_url}`: profile.profile, ' user here')
        if (user) {
            setProfile({ username: user.username, email: user.email, profile: user.image_url ? `http://localhost:3001/${user.image_url}`: profile.profile });
        }
    }, [user]);

    useEffect(() => {
        return () => {
            if (profile.profile.startsWith('blob:')) {
                URL.revokeObjectURL(profile.profile);
            }
        };
    }, [profile.profile]);

    //Handles file change when user uploads a new profile picture
    const handleFileChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            const objectUrl = URL.createObjectURL(file);
            setProfile(prev => ({ ...prev, profile: objectUrl }));
            setFile(file);
        }
    };

    //Handles changes to username and password once submit is clicked
    const handleSubmit = async (e) => {
        e.preventDefault();
        if (isUpdating) {
            setIsLoading(true);
            const formData = new FormData();
            formData.append('username', profile.username);
            formData.append('email', profile.email);
            if (file) {
                formData.append('profileImage', file);
            }

            try {
                const response = await axios.put('/api/users', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                    },
                });
                setIsUpdating(false);
            } catch (error) {
                console.error(error);
            }
            finally {
                setIsUpdating(false)
                setIsLoading(false)
            }
        }
    };

    const handleChangePassword = async () => {
        setPasswordError('');

        // Ensure that currentPassword and newPassword are not empty
        if (!currentPassword || !newPassword) {
            alert('Please fill in all fields');
            return;
        }

        try {
            await axios.put('/api/change-password', {
                userId: user.id, // Assuming you have the user's ID
                currentPassword,
                newPassword,
            }, {
                headers: {
                    'Authorization': `Bearer ${localStorage.getItem('token')}`, // Ensure the user is authenticated
                },
            });
            alert('Password changed successfully.');
            // Clear password fields
            setCurrentPassword('');
            setNewPassword('');
        } catch (error) {
            console.error("Failed to change password:", error.response?.data?.message || error.message);
            // Here, you would check the response from your backend to determine the type of error
            // For example, if your backend sends a specific message or status code for incorrect password:
            if (error.response && error.response.data && error.response.data.message === 'Incorrect current password') {
                console.log("Setting password error");
                setPasswordError('Incorrect current password');
            }
            else {
                alert('Failed to change password.');
            }
        }
    };


    return (
        <div className='loginPage'>
            <div className="login-container">
                <form className="login-form" onSubmit={handleSubmit}>
                    <h2><center>    Profile   </center></h2>
                    <img className="circle" height="128" width="128" src={profile.profile} alt="Profile" />
                    {/* Profile Update Section */}
                    <div className="profile-update-section">
                        <div className="input-group">
                            <label>User Name</label>
                            <input
                                placeholder='Enter User Name'
                                type="text"
                                disabled={!isUpdating}
                                value={profile.username}
                                required
                                onChange={(e) => setProfile((prev) => ({ ...prev, username: e.target.value }))}
                            />
                        </div>
                        <div className="input-group">
                            <label>Email</label>
                            <input
                                placeholder='Enter Email'
                                type="email"
                                disabled={!isUpdating}
                                value={profile.email}
                                required
                                onChange={(e) => setProfile((prev) => ({ ...prev, email: e.target.value }))}
                            />
                        </div>
                        {isUpdating && (
                            <div className="input-group">
                                <label>Profile Picture</label>
                                <input
                                    type="file"
                                    accept="image/png, image/jpeg, image/gif"
                                    onChange={handleFileChange}
                                />
                            </div>
                        )}
                        {!isUpdating && <button type="button" className="login-button" onClick={() => setIsUpdating(true)}>Update Profile</button>}
                        {isUpdating && (
                            <div>
                                <button type="button" className="login-button cancel-button" onClick={() => setIsUpdating(false)}>Cancel</button>
                                <button type="submit" className='login-button' disabled={isLoading}>{isLoading ? "Saving..." : "Save"}</button>
                            </div>
                        )}
                    </div>
                    {/* Password Change Section */}
                    <div className="password-change-section" style={{marginTop: "20px"}}>
                        <h3>Change Password</h3>
                        <div className="input-group">
                            <label>Current Password</label>
                            <input
                                type="password"
                                placeholder='Current Password'
                                value={currentPassword}
                                onChange={(e) => setCurrentPassword(e.target.value)}
                            />
                        </div>
                        <div className="input-group">
                            <label>New Password</label>
                            <input
                                type="password"
                                placeholder='New Password'
                                value={newPassword}
                                onChange={(e) => setNewPassword(e.target.value)}
                            />
                        </div>
                        {passwordError && <div style={{ color: 'red', marginBottom: '10px' }}>{passwordError}</div>}
                        <button type="button" className='login-button' onClick={handleChangePassword}>Change Password</button>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Profile;