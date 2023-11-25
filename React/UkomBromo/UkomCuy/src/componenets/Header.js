import React, { useEffect, useState } from 'react'
import Logout from '../Resources/Icons/log-out-unselected-72.png'
import { useNavigate } from 'react-router-dom';

const Header = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [isAdmin, setIsAdmin] = useState(false);

  const navigate = useNavigate();

  useEffect(() => {
    const statusLogin = localStorage.getItem('isLoggedIn');
    const statusLoginAdmin = localStorage.getItem('isAdmin');

    if (statusLogin === 'true' || statusLoginAdmin === 'true') {
      setIsLoggedIn(true);
      setIsAdmin(true)
    }
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('akun');
    localStorage.setItem('isLoggedIn', 'false');
    localStorage.setItem('isAdmin', 'false');
    setIsLoggedIn(false);
    setIsAdmin(false);
    
    localStorage.removeItem('_grecaptcha');
  
    navigate('/login');
  };
  return (
    <div>
        <nav className="main-header navbar navbar-primary navbar-dark navbar-expand navbar-light">
          <ul className="navbar-nav">
            <li className="nav-item">
              <a className="nav-link" data-widget="pushmenu" href="#" role="button"><i className="fas fa-bars" /></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
              <h3>Dashboard</h3>
            </li>
          </ul>
          
          <ul className="navbar-nav ml-auto">
            
              <li className="nav-item">
                  <img onClick={handleLogout} src={Logout} alt="" width='25px'/>
              </li>
            
          </ul>

        </nav>
    </div>
  )
}

export default Header
