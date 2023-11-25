import React from 'react'
import Pesanan from '../Resources/Icons/purchase-tag-alt-unselected-72.png';
import TiketSaya from '../Resources/Icons/airplane-ticket-black.png';
import Logo from '../Resources/App Logo Alt.png';
import { Link } from 'react-router-dom';

function SideNavU() {
  return (
    <div>
      <aside className="main-sidebar sidebar-light-primary elevation-4">
        {/* Brand Logo */}
        
        {/* Sidebar */}
        <div className="sidebar">
          {/* Sidebar user panel (optional) */}
          <div className="user-panel mt-3 pb-3 mb-3 d-flex justify-content-center">
            <div class="image">
              <img src={Logo} alt="Bromo AirLines Logo" className="brand-image img-circle elevation-3" style={{opacity: '.8'}} />
            </div>
            <div className="info">
              <span className="brand-text font-weight-bold">Bromo AirLines</span>
            </div>
          </div>
          
          {/* Sidebar Menu */}
          <nav className="mt-2">
            <ul className="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
              
              <li className="nav-item bg-primary">
                <Link to="/userpage" className="nav-link">
                  <i className="nav-icon fa fa-tachometer-alt" />
                  <p>
                    Dashboard 
                  </p>
                </Link>
              </li>
              
              <li className="nav-item">
                <Link to="/userpage/pesanan" className="nav-link">
                  <img src={Pesanan} alt="" width='25px'/>
                  <p className='ml-2'>
                    Buat Pesanan
                  </p>
                </Link>
              </li>
              
              <li className="nav-item">
                <Link to="/userpage/tiketsaya" className="nav-link">
                  <img src={TiketSaya} alt="" width='25px'/>
                  <p className='ml-2'>
                    Tiket Saya
                  </p>
                </Link>
              </li>
              
            </ul>
          </nav>
        </div>
      </aside>
    </div>
  )
}

export default SideNavU
