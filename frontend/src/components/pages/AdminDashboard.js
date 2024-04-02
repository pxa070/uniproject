import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './AdminDashboard.css';

function AdminDashboard() {
    const [users, setUsers] = useState([]);
    const [questions, setQuestions] = useState([]);

    useEffect(() => {
        fetchUsers();
        fetchQuestions();
    }, []);

    const fetchUsers = async () => {
        try {
            const res = await axios.get('/api/admin/users', {
                headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
            }); // Ensure this endpoint is correct and you're passing the token
            setUsers(res.data);
        } catch (error) {
            console.error("Failed to fetch users:", error);
        }
    };

    const fetchQuestions = async () => {
        try {
            const res = await axios.get('/api/admin/questions', {
                headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
            }); // Ensure this endpoint is correct and you're passing the token
            setQuestions(res.data);
        } catch (error) {
            console.error("Failed to fetch questions:", error);
        }
    };

    const deleteUser = async (userId) => {
        console.log("Deleting user with ID:", userId); // Add this line to log the user ID
        try {
            const token = localStorage.getItem('token');
            await axios.delete(`/api/admin/users/${userId}`, {
                headers: { Authorization: `Bearer ${token}` }
            });
            fetchUsers(); // Refresh the user list here
        } catch (error) {
            console.error("Failed to delete user:", error.response?.data?.message || error.message);
        }
    };

    const deleteQuestion = async (questionId) => {
        const token = localStorage.getItem('token');
        try {
            await axios.delete(`/api/admin/questions/${questionId}`, {
                headers: { Authorization: `Bearer ${token}` }
            });
            fetchQuestions(); // Refresh the questions list here
        } catch (error) {
            console.error("Failed to delete question:", error.response?.data?.message || error.message);
        }
    };

    return (
        <div className="admin-dashboard">
            <h2>Admin Dashboard</h2>
            <div className="admin-section">
                <h3>Users</h3>
                {users.map(user => (
                    <div className="admin-item" key={user.id}>
                        <div className= "admin-item-details ">
                        {user.username} - {user.email}
                        </div>
                        <button onClick={() => deleteUser(user.id)}>Delete User</button>
                    </div>
                ))}
            </div>
            <div className= "admin-section">
                <h3>Questions</h3>
                {questions.map(question => (
                    <div  className="admin-item" key={question.question_id}>
                        <div className = "admin-item-details">
                        {question.question_text}
                        </div>
                        <button onClick={() => deleteQuestion(question.question_id)}>Delete Question</button>

                    </div>
                ))}
            </div>
        </div>
    );
}

export default AdminDashboard;
