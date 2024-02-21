// src/index.js

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { AuthProvider } from './components/context/AuthContext'; // Correct relative import

ReactDOM.render(
    <React.StrictMode>
        <AuthProvider>
            <App />
        </AuthProvider>
    </React.StrictMode>,
    document.getElementById('root')
);
