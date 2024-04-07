import React, { createContext, useContext, useState, useEffect } from 'react';


// Create the context with a default value
export const AuthContext = createContext({
    isLoggedIn: false,
    user: null, // Added user state
    login: () => {},
    logout: () => {},
    setUser: () => {} // Added setUser function
});

// Custom hook for easy context consumption
export const useAuth = () => useContext(AuthContext);

// Define the provider component that will wrap your app or component tree
export const AuthProvider = ({ children }) => {
    const [isLoggedIn, setIsLoggedIn] = useState(false);
    const [user, setUser] = useState(null); // Declare with 'useState' hook
    useEffect(() => {
        // Check for token presence in localStorage on initial load
        const token = localStorage.getItem('token');
        if (token) {
            setIsLoggedIn(true);
        }
    }, []);

    // Login function updates isLoggedIn state and stores token
    const login = (token,user) => {
        localStorage.setItem('token', token);
        console.log(user,"user in login")
        setIsLoggedIn(true);
        setUser(user);
    };

    // Logout function clears token and updates state
    const logout = () => {
        resetSettingsToDefault();

        localStorage.removeItem('token'); // Clear saved token
        setIsLoggedIn(false);
        setUser(null)
    };

    const resetSettingsToDefault = () => {
        localStorage.setItem('contrast', 'normal'); // Reset to default contrast
        localStorage.setItem('textSize', 'medium'); // Reset to default text size
        document.body.className = 'contrast-normal text-medium'; // Apply default class names
    };



    // The value prop of the provider provides state and functions to consuming components
    return (
        <AuthContext.Provider value={{ isLoggedIn, login, logout, user, setUser}}>
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