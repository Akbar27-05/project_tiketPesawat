import React, { useEffect, useState } from "react";
import Logout from "../Resources/Icons/log-out-unselected-72.png";
import { Link, useNavigate } from "react-router-dom";

const HeaderU = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const navigate = useNavigate();

  useEffect(() => {
    const statusLogin = localStorage.getItem('isLoggedIn');

    if (statusLogin === 'true') {
      setIsLoggedIn(true);
    }
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('akun');
    localStorage.setItem('isLoggedIn', 'false');
    setIsLoggedIn(false);
    
    localStorage.removeItem('_grecaptcha');
    navigate('/login');
  };
  return (
    <div>
      <nav className="main-header navbar navbar-expand navbar-white navbar-light">
        <ul className="navbar-nav">
          <li className="nav-item">
            <a
              className="nav-link"
              data-widget="pushmenu"
              href="#"
              role="button"
            >
              <i className="fas fa-bars" />
            </a>
          </li>
          <li class="nav-item d-none d-sm-inline-block">
            <h5 className="nav-link text-dark"></h5>
          </li>
        </ul>

        {isLoggedIn ? (
          <ul className="navbar-nav ml-auto">
            <li className="nav-item">
                <a onClick={handleLogout} className="text-success">Logout</a>
            </li>
          </ul>
        ) : (
          <ul className="navbar-nav ml-auto">
            <li className="nav-item">
              <Link to="/login" className="nav-link">
                <p>Log In</p>
              </Link>
            </li>
            <li className="nav-item">
              <Link to="/register" className="nav-link">
                <p className="text-success">Register</p>
              </Link>
            </li>
          </ul>
        )}
      </nav>
    </div>
  );
};

export default HeaderU;
