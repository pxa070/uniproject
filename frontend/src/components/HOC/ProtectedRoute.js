import { Navigate } from 'react-router-dom';
import { useAuth } from "../context/AuthContext";

// Extend ProtectedRoute to accept an "allowedRoles" prop
const ProtectedRoute = ({ children, allowedRoles }) => {
    const { isLoggedIn, userRole } = useAuth(); // Assume useAuth() now also provides userRole

    // Redirect to login if not logged in
    if (!isLoggedIn) {
        return <Navigate to="/login" replace />;
    }

    // If allowedRoles is defined and userRole is not in allowedRoles, redirect to an Unauthorized page
    if (allowedRoles && !allowedRoles.includes(userRole)) {
        return <Navigate to="/" replace />;
    }

    // If logged in and (if applicable) role is authorized, render children
    return children;
};

export default ProtectedRoute;
