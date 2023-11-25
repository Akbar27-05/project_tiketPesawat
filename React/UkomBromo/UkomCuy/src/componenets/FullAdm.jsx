import React from 'react'
import Header from './Header'
import SideNav from './SideNav'
import Footer from './Footer'
import { Outlet, useNavigate } from 'react-router-dom';
import NotFound from '../View/NotFound';

const FullAdm = () => {
  const navigate = useNavigate();
    
  const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
  const isAdmin = localStorage.getItem('isAdmin') === 'true';

  if (!isLoggedIn || !isAdmin) {
    
    navigate('/login'); 
    return <NotFound/>;
  }else
  return (
    <body className="hold-transition sidebar-mini layout-fixed">
      <div className="wrapper">
        <Header/>
        <Outlet/>
        <SideNav/>
        <Footer/>
      </div>
    </body>
  )
}

export default FullAdm
