import React from 'react'
import MasterBandara from '../Resources/Icons/map-unselected-72.png';
import MasterMaskapai from '../Resources/Icons/plane-take-off-unselected-72.png';
import MasterJadwal from '../Resources/Icons/calendar-unselected-72.png';
import MasterKode from '../Resources/Icons/purchase-tag-alt-unselected-72.png';
import UbahStatus from '../Resources/Icons/notepad-unselected-72.png';
import Pembayaran from '../Resources/Icons/purchase-tag-alt-unselected-72.png';

import Logo from '../Resources/App Logo Alt.png'

import { Link } from 'react-router-dom';

function SideNav() {
  return (
    <div>
      <aside className="main-sidebar sidebar-light-primary elevation-4">
        {/* Brand Logo */}
        <a href="index3.html" className="brand-link">
          <img src={Logo} alt="AdminLTE Logo" className="brand-image img-circle elevation-3" style={{opacity: '.8'}} />
          <span className="brand-text font-weight-light">Admin Page</span>
        </a>
        {/* Sidebar */}
        <div className="sidebar">
          {/* Sidebar user panel (optional) */}
          <div className="user-panel mt-3 pb-3 mb-3 d-flex justify-content-center">
            <div className="info">
              <h2 href="#" className="d-block text-lg">Admin Name</h2>
            </div>
          </div>
          
          {/* Sidebar Menu */}
          <nav className="mt-2">
            <ul className="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
              
              <li class="nav-item bg-primary">
                <Link to="/adminpage" className="nav-link">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Dashboard
                  </p>
                </Link>
              </li>

              <li className="nav-item">
                <Link to="/adminpage/masterbandara" className="nav-link" >
                  <img src={MasterBandara} alt="" width='25px'/>
                  <p className='ml-2'>
                    Master Bandara
                  </p>
                </Link>
              </li>
              
              <li className="nav-item">
                <Link to="/adminpage/mastermaskapai" className="nav-link">
                  <img src={MasterMaskapai} alt="" width='25px'/>
                  <p className='ml-2'>
                    Master Maskapai
                  </p>
                </Link>
              </li>
              
              <li className="nav-item">
                <Link to="/adminpage/jadwalpenerbangan" className="nav-link">
                  <img src={MasterJadwal} alt="" width='25px'/>
                  <p className='ml-2'>
                    Jadwal Penerbangan
                  </p>
                </Link>
              </li>
              
              <li className="nav-item">
                <Link to="/adminpage/kodepromo" className="nav-link">
                  <img src={MasterKode} alt="" width='25px'/>
                  <p className='ml-2'>
                    Kode Promo
                  </p>
                </Link>
              </li>
              
              <li className="nav-item">
                <Link to="/adminpage/ubahstatus" className="nav-link">
                  <img src={UbahStatus} alt="" width='25px'/>
                  <p className='ml-2'>
                    Ubah Status
                  </p>
                </Link>
              </li>

              <li className="nav-item">
                <Link to="/adminpage/accept" className="nav-link">
                  <img src={Pembayaran} alt="" width='25px'/>
                  <p className='ml-2'>
                    Accept Pembayaran
                  </p>
                </Link>
              </li>

              
            </ul>
          </nav>
          {/* /.sidebar-menu */}
        </div>
        {/* /.sidebar */}
      </aside>
    </div>
  )
}

export default SideNav
