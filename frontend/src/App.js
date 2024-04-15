import React , {useEffect, useState} from 'react';
import Navbar from './components/common/navbar';
import './App.css';
import Home from './components/pages/HomePage';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Login from './components/pages/Login';
import SignUp from './components/pages/SignUp';
import Footer from "./components/common/footer";
import './axiosConfig';
import Profile from "./components/pages/Profile";
import UploadQuestion from "./components/pages/UploadQuestion";
import axios from 'axios'
import { useAuth } from './components/context/AuthContext';
import ProtectedRoute from './components/HOC/ProtectedRoute';
import QuestionList from './components/pages/QuestionList';
import QuestionView from './components/pages/QuestionView';
import ForgotPassword from './components/pages/ForgotPassword';
import ResetPassword from './components/pages/ResetPassword';
import Settings from "./components/pages/Settings";
import AdminDashboard from "./components/pages/AdminDashboard";
import GDPRPage from "./components/pages/GDPR";



function App() {
    const [isLoading,setIsLoading] = useState(true)
    const { setUser,logout } = useAuth();
    const getUser = async () => {
        try {
            const { data } = await axios.get('api/getMe');
            setUser(data.user)

        }
        catch(err) {
            logout()
        }
        finally {
            setIsLoading(false)
        }
    }
    useEffect(()=>{
        if(localStorage.getItem("token")){
            getUser()
        }
        else {
            setIsLoading(false)
        }
    },[])
    return (
        <>
            {
                isLoading ?  <> </> :
                    <Router>

                        <Navbar/>
                        <Routes>
                            <Route path='/' element={<Home />} />
                            <Route path='/login' element={<Login />} />
                            <Route path='/sign-up' element={<SignUp />} />
                            <Route path='/forgot-password' element={<ForgotPassword/>}/>
                            <Route path="/reset-password/:token" element={<ResetPassword/>}/>
                            <Route path='/Profile' element={<ProtectedRoute><Profile /></ProtectedRoute>} />
                            <Route path="/admin/dashboard" element={<ProtectedRoute><AdminDashboard /></ProtectedRoute>}/>
                            <Route path='/UploadQuestion' element={<ProtectedRoute><UploadQuestion /></ProtectedRoute>}/>
                            <Route path='/question/list' element={<ProtectedRoute><QuestionList/></ProtectedRoute>}/>
                            <Route path="/question/:id" element={<ProtectedRoute><QuestionView/></ProtectedRoute>}/>
                            <Route path= "/Settings" element={<ProtectedRoute><Settings/></ProtectedRoute>}/>
                            <Route path='/GDPR' element={<GDPRPage />} />


                        </Routes>

                        <Footer />

                    </Router>
            }
        </>

    );
}


export default App;