import React, { useContext, useEffect, useState } from 'react';
import { AuthContext } from '../context/AuthContext';
import axios from 'axios';
import './Profile.css';

function Profile() {
    const { user } = useContext(AuthContext);
    const [isUpdating, setIsUpdating] = useState(false);
    const [isLoading,setIsLoading] = useState(false);
    const [profile, setProfile] = useState({ username: "", email: "", profile: "http://www.gravatar.com/avatar/9017a5f22556ae0eb7fb0710711ec125?s=128" });
    const [file, setFile] = useState(null);

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

    const handleFileChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            const objectUrl = URL.createObjectURL(file);
            setProfile(prev => ({ ...prev, profile: objectUrl }));
            setFile(file);
        }
    };

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

    return (
        <div className='loginPage'>
            <div className="login-container">
                <form className="login-form" onSubmit={handleSubmit}>
                    <h2 className='formHeader'>Profile</h2>
                    <img className="circle" height="128" width="128" src={profile.profile} alt="Profile" />
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
                    {!isUpdating && <button type="button" className="login-button" onClick={() => setIsUpdating(true)}>Update</button>}
                    {isUpdating && (
                        <div>
                            <button type="button" className="login-button cancel-button" onClick={() => {
                                setIsUpdating(false);
                                setProfile({ username: user.username, email: user.email, profile: user.image_url || "http://www.gravatar.com/avatar/9017a5f22556ae0eb7fb0710711ec125?s=128" });
                            }}>Cancel</button>
                            <button type="submit" className='login-button' disabled={isLoading}>{isLoading ? "Saving..." : "Save"}</button>
                        </div>
                    )}
                </form>
            </div>
        </div>
    );
}

export default Profile