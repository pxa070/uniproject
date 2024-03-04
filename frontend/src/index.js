// src/index.js

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { AuthProvider } from './components/context/AuthContext'; // Correct relative import
import 'axios';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <AuthProvider>
            <App />
        </AuthProvider>
    </React.StrictMode>
);