import React from 'react';
import Navbar from './components/common/navbar';
import './App.css';
import Home from './components/pages/HomePage';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Login from './components/pages/Login';
import SignUp from './components/pages/SignUp';
import SubjectAreas from "./components/pages/SubjectAreas";
import Footer from "./components/common/footer";

import Profile from "./components/pages/Profile";
import UploadQuestion from "./components/pages/UploadQuestion";


function App() {
    return (
        <Router>

            <Navbar/>
            <Routes>
                <Route path='/' element={<Home />} />
                <Route path='/subjectareas' element={<SubjectAreas />} />
                <Route path='/login' element={<Login />} />
                <Route path='/sign-up' element={<SignUp />} />
                <Route path='/Profile' element={<Profile />} />
                <Route path='/UploadQuestion' element={<UploadQuestion />}/>
            </Routes>

                <Footer />

        </Router>

    );
}


export default App;
