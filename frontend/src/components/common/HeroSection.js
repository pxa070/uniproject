import React, { useContext } from 'react';
import '../../App.css';
import { Button } from './Button';
import './HeroSection.css';
// Import your auth context or similar mechanism
import {AuthContext} from '../context/AuthContext'; // This is an example; adjust it based on your implementation

function HeroSection() {
    const { isLoggedIn } = useContext(AuthContext); // Assuming AuthContext provides this

    // Determine where the button should redirect based on login status

    const uploadQuestionRedirect = isLoggedIn ? '/UploadQuestion' : '/login';

    return (
        <div className='hero-container'>
            <video src='/Chemical_Periodic_Table_with_solution.mp4' autoPlay loop muted className='hero-video'></video>
            <h1>EXPLORE KNOWLEDGE</h1>
            <p>Find resources for your study questions</p>
            <div className='hero-btns'>
                <Button
                    className='btns'
                    buttonStyle='btn--outline'
                    buttonSize='btn--large'
                    redirectTo={uploadQuestionRedirect} // Use the determined redirect path
                >
                    UPLOAD QUESTION <i className='fas fa-upload' />
                </Button>
            </div>
        </div>
    );
}

export default HeroSection;


