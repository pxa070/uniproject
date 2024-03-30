import React from 'react';

function AccessibilitySettings() {
    // Function to toggle theme
    const toggleTheme = () =>  {
        if (document.body.classList.contains('dark-mode')) {
            document.body.classList.replace('dark-mode', 'light-mode');
            localStorage.setItem('theme', 'light');
        } else {
            document.body.classList.replace('light-mode', 'dark-mode');
            localStorage.setItem('theme', 'dark');
        }
    }
    // Function to read text
    const readText = (text) => {
        const msg = new SpeechSynthesisUtterance(text);
        window.speechSynthesis.speak(msg);
    };

    document.addEventListener('DOMContentLoaded', () => {
        if (localStorage.getItem('theme') === 'dark') {
            document.body.classList.add('dark-mode');
        } else {
            document.body.classList.add('light-mode');
        }
    });

    return (
        <div>
            <button id="theme-toggle" onClick={toggleTheme}>Toggle Dark/Light Mode</button>
            <div>
                <p id="content-to-read">This is a sample text to read.</p>
                <button onClick={() => readText(document.getElementById('content-to-read').innerText)}>Read Text</button>
            </div>
        </div>
    );
}

export default AccessibilitySettings;

