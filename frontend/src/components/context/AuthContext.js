import React, { createContext, useContext, useState, useEffect } from 'react';


// Create the context with a default value
export const AuthContext = createContext({
    isLoggedIn: false,
    userId: null, // Added userId state
    login: () => {},
    logout: () => {},
    setUserId: () => {} // Added setUserId function
});

// Custom hook for easy context consumption
export const useAuth = () => useContext(AuthContext);

// Define the provider component that will wrap your app or component tree
export const AuthProvider = ({ children }) => {
    const [isLoggedIn, setIsLoggedIn] = useState(false);
    const [userId] = useState(null); // Declare with 'useState' hook
    const setUserId = (id) => {
        setUserId(id);
    };
    useEffect(() => {
        // Check for token presence in localStorage on initial load
        const token = localStorage.getItem('token');
        if (token) {
            setIsLoggedIn(true);
        }
    }, []);

    // Login function updates isLoggedIn state and stores token
    const login = (token) => {
        localStorage.setItem('token', token);
        // Assuming API response structure is { token, userId }, extract here if so
        const userId = token.userId; // Or wherever appropriate to get userId
        setIsLoggedIn(true);
        setUserId(userId);
    };

    // Logout function clears token and updates state
    const logout = () => {
        localStorage.removeItem('token'); // Clear saved token
        setIsLoggedIn(false);
    };



    // The value prop of the provider provides state and functions to consuming components
    return (
        <AuthContext.Provider value={{ isLoggedIn, login, logout, userId, setUserId}}>
            {children}
        </AuthContext.Provider>
    );
};

/*


// src/context/AuthContext.js
import React, { createContext, useContext, useState } from 'react';

// Create the context with a default value
export const AuthContext = createContext({ isLoggedIn: false });

export const useAuth = () => useContext(AuthContext);

// Define the provider component that will wrap your app or component tree
export const AuthProvider = ({ children }) => {
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    // The login and logout functions update the isLoggedIn state
    const login = (token) => {
        localStorage.setItem('token', token);
        setIsLoggedIn(true);
    };

    const logout = () => {
        localStorage.removeItem('token');
        setIsLoggedIn(false);
    };

    // The value prop of the provider will provide these to any consuming components
    return (
        <AuthContext.Provider value={{ isLoggedIn, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};
*/