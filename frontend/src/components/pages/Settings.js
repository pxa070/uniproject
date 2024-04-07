import React, { useEffect, useState } from 'react';
import './Settings.css'; // Your CSS file to style the settings page

function AccessibilitySettings() {
    const [contrast, setContrast] = useState(localStorage.getItem('contrast') || 'normal');
    const [textSize, setTextSize] = useState(localStorage.getItem('textSize') || 'medium');

    useEffect(() => {
        // Apply the class names when the component mounts or when contrast/textSize changes
        document.body.className = `contrast-${contrast} text-${textSize}`;
    }, [contrast, textSize]);

    const handleContrastChange = (newContrast) => {
        setContrast(newContrast);
        localStorage.setItem('contrast', newContrast);
        document.body.className = `contrast-${newContrast} text-${textSize}`;
    };

    const handleTextSizeChange = (newTextSize) => {
        setTextSize(newTextSize);
        localStorage.setItem('textSize', newTextSize);
        document.body.className = `contrast-${contrast} text-${newTextSize}`;
    };

    return (
        <div className="settings-container">
            <h1>Settings</h1>
            {/* Contrast Section */}
            <div className="settings-section">
                <h2>Contrast</h2>
                <div className="button-group">
                    <button onClick={() => handleContrastChange('normal')}>Normal</button>
                    <button onClick={() => handleContrastChange('high')}>High</button>
                    <button onClick={() => handleContrastChange('low')}>Low</button>
                </div>
            </div>
            {/* Text Size Section */}
            <div className="settings-section">
                <h2>Text Size</h2>
                <div className="button-group">
                    <button onClick={() => handleTextSizeChange('small')}>Small</button>
                    <button onClick={() => handleTextSizeChange('medium')}>Medium</button>
                    <button onClick={() => handleTextSizeChange('large')}>Large</button>
                </div>
            </div>
        </div>
    );
}

export default AccessibilitySettings;
