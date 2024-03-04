// src/axiosConfig.js
import axios from 'axios';

axios.defaults.baseURL = process.env.REACT_APP_API_URL;
axios.defaults.headers = {
    'Content-Type': 'application/json',
}
// Configure Axios instance with interceptor
axios.interceptors.request.use(config => {
    const token = localStorage.getItem('token');
    if (token) {
        config.headers['Authorization'] = `Bearer ${token}`;
    }
    return config;
}, error => {
    return Promise.reject(error);
});

