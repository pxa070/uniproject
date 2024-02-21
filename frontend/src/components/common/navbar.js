import React, { useState, useEffect } from 'react';
import { Button } from './Button';
import { Link } from 'react-router-dom';
import './navbar.css';
import { useAuth } from "../context/AuthContext";

function Navbar() {
    const [click, setClick] = useState(false);
    const [button, setButton] = useState(true);
    const { isLoggedIn, logout } = useAuth();

    const handleClick = () => setClick(!click);
    const closeMobileMenu = () => setClick(false);

    const showButton = () => {
        if (window.innerWidth <= 960) {
            setButton(false);
        } else {
            setButton(true);
        }
    };

    useEffect(() => {
        showButton();
        const handleResize = () => showButton();
        window.addEventListener('resize', handleResize);
        return () => window.removeEventListener('resize', handleResize);
    }, []);

    return (
        <>
            <nav className='navbar'>
                <div className='navbar-container'>
                    <Link to='/' className='navbar-logo' onClick={closeMobileMenu}>
                        <img src="/studyhub.png" alt="StudyHub" style={{ marginRight: '10px', height: '50px' }} />
                        StudyHub <i className='fab fa-typo3' />
                    </Link>
                    <div className='menu-icon' onClick={handleClick}>
                        <i className={click ? 'fas fa-times' : 'fas fa-bars'} />
                    </div>
                    <ul className={click ? 'nav-menu active' : 'nav-menu'}>
                        <li className='nav-item'>
                            <Link to='/' className='nav-links' onClick={closeMobileMenu}>Home</Link>
                        </li>
                        <li className='nav-item'>
                            <Link to='/subjectareas' className='nav-links' onClick={closeMobileMenu}>Subject Area</Link>
                        </li>
                        {!isLoggedIn && (
                            <>
                                <li className='nav-item'>
                                    <Link to='/login' className='nav-links' onClick={closeMobileMenu}>Login</Link>
                                </li>
                                <li>
                                    <Link to='/sign-up' className='nav-links-mobile' onClick={closeMobileMenu}>Sign Up</Link>
                                </li>
                            </>
                        )}
                        {isLoggedIn && (
                            <>
                                <li className='nav-item'>
                                    <Link to='/Profile' className='nav-links' onClick={closeMobileMenu}>Profile</Link>
                                </li>
                                <li className='nav-item'>
                                    <Link to='/Settings' className='nav-links' onClick={closeMobileMenu}>Settings</Link>
                                </li>
                                <li>
                                    <button className='nav-links-mobile' onClick={logout}>Logout</button>
                                </li>
                            </>
                        )}
                    </ul>
                    {isLoggedIn ? (
                        <Button onClick={logout} buttonStyle='btn--outline'>Logout</Button>
                    ) : (
                        button && <Button buttonStyle='btn--outline' buttonSize='btn--large' redirectTo='/sign-up'>Sign Up</Button>
                    )}
                </div>
            </nav>
        </>
    );
}

export default Navbar;









/*
import React, { useState, useEffect } from 'react';
import { Button } from './Button';
import { Link } from 'react-router-dom';
import './navbar.css';
import {useAuth} from "../context/AuthContext";

function Navbar() {
    const [click, setClick] = useState(false);
    const [button, setButton] = useState(true);
    const {isLoggedIn, logout} = useAuth();

    const handleClick = () => setClick(!click);
    const closeMobileMenu = () => setClick(false);

    const showButton = () => {
        if (window.innerWidth <= 960) {
            setButton(false);
        } else {
            setButton(true);
        }
    };

    useEffect(() => {
        showButton();
        // Cleanup the event listener on component unmount
        const handleResize = () => showButton();
        window.addEventListener('resize', handleResize);
        return () => window.removeEventListener('resize', handleResize);
    }, []);

    return (
        <>
            <nav className='navbar'>
                <div className='navbar-container'>
                    <Link to='/' className='navbar-logo' onClick={closeMobileMenu}>
                        <img src="/studyhub.png" alt="StudyHub" style={{ marginRight: '10px', height: '50px' }} />
                    </Link>

                    <div className='menu-icon' onClick={handleClick}>
                        <i className={click ? 'fas fa-times' : 'fas fa-bars'} />
                    </div>
                    <ul className={click ? 'nav-menu active' : 'nav-menu'}>
                        <li className='nav-item'>
                            <Link to='/' className='nav-links' onClick={closeMobileMenu}>
                                Home
                            </Link>
                        </li>
                        <li className='nav-item'>
                            <Link to='/subjectareas' className='nav-links' onClick={closeMobileMenu}>
                                Subject Area
                            </Link>
                        </li>
                        <li className='nav-item'>
                            <Link to='/login' className='nav-links' onClick={closeMobileMenu}>
                                Login
                            </Link>
                        </li>
                        <li>
                            <Link to='/sign-up' className='nav-links-mobile' onClick={closeMobileMenu}>
                                Sign Up
                            </Link>
                        </li>
                    </ul>
                    {button && <Button buttonStyle='btn--outline' buttonSize='btn--large' redirectTo='/sign-up'>Sign Up</Button>}



                </div>
            </nav>
        </>
    );
}

export default Navbar;

*/;