import React, { useState} from 'react';
import { Link } from 'react-router-dom';
import './navbar.css';
import { useAuth } from "../context/AuthContext";

function Navbar(activeItem) {
    const [click, setClick] = useState(false);
    const { isLoggedIn, logout } = useAuth();
    const isAdmin = localStorage.getItem('role') === 'admin'; // Check if user is an admin

    const handleClick = () => setClick(!click);
    const closeMobileMenu = () => setClick(false);

    return (
        <>
            <nav className='navbar'>
                <div className='navbar-container'>
                    <Link to='/' className='navbar-logo' onClick={closeMobileMenu}  >
                        <img src="/studyhub.png" alt="StudyHub" style={{ marginRight: '10px', height: '50px' }} />
                        StudyHub <i className='fab fa-typo3' />
                    </Link>
                    <div className='menu-icon' onClick={handleClick}>
                        <i className={click ? 'fas fa-times' : 'fas fa-bars'} />
                    </div>
                    <ul className={click ? 'nav-menu active' : 'nav-menu'}>


                        {isLoggedIn && (
                            <>
                                {isAdmin && (
                                    <li className='nav-item'>
                                        <Link to='/admin/dashboard' className='nav-links' onClick={closeMobileMenu}>Admin</Link>
                                    </li>
                                )}
                                <li className='nav-item'>
                                    <Link to='/question/list' className='nav-links' onClick={closeMobileMenu}>My Questions</Link>
                                </li>
                                <li className='nav-item'>
                                    <Link to='/Profile' className='nav-links' onClick={closeMobileMenu}>Profile</Link>
                                </li>
                                <li className='nav-item'>
                                    <Link to='/Settings' className='nav-links' onClick={closeMobileMenu}>Settings</Link>
                                </li>
                                <li className='nav-item'>
                                    <Link to='/UploadQuestion' className='nav-links' onClick={closeMobileMenu}>Upload Question</Link>
                                </li>
                                <li className='nav-item'>
                                    <Link to='/login' className='nav-links' onClick={logout} >
                                      Sign Out
                                    </Link>
                                </li>
                            </>
                        )}
                        {!isLoggedIn && click && (
                            <li className='nav-item-mobile'>
                                <Link to='/login' className='nav-links-mobile' onClick={closeMobileMenu}>Sign In</Link>
                            </li>
                        )}
                    </ul>
                    {!isLoggedIn && !click && (
                        <Link to='/login' className='nav-link-desktop'>Sign In</Link>
                    )}
                </div>
            </nav>
        </>
    );
}

export default Navbar;
