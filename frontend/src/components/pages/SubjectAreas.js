import React from 'react';
import { Link } from 'react-router-dom';
import './SubjectAreas.css';
import Cards from "../common/Cards"; // Make sure to create a corresponding CSS file for styling

// Dummy data for the subject areas
const subjects = [
    { name: 'Mathematics', link: '/mathematics' },
    { name: 'Physics', link: '/physics' },
    { name: 'Chemistry', link: '/chemistry' },
    { name: 'Biology', link: '/biology' },
    // ...other subjects
];

function SubjectAreas() {
    return (
        <div className="subject-areas-container">
            <h2>Subject Areas</h2>
            <ul className="subject-list">
                {subjects.map((subject, index) => (
                    <li key={index} className="subject-item">
                        <Link to={subject.link} className="subject-link">
                            {subject.name}
                        </Link>
                    </li>
                ))}
            </ul>
            <Cards />
        </div>


    );
}

export default SubjectAreas;
