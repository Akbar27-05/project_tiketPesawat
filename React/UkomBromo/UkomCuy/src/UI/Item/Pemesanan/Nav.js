import React from 'react'
import { Link } from 'react-router-dom'


const Nav = () => {
  return (
    <div>
       <nav className="header navbar navbar-expand-md navbar-light navbar-white">
  <div className="container">
    <button className="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span className="navbar-toggler-icon" />
    </button>
    <div className="collapse navbar-collapse order-3" id="navbarCollapse">
      {/* Left navbar links */}
      <ul className="navbar-nav">
            <li class="nav-item d-none d-sm-inline-block">
              {/* <a href="index3.html" class="nav-link">Home</a> */}
              <h4>Bromo AirLines</h4>
            </li>
      </ul>
    </div>
    {/* Right navbar links */}
    <ul className="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
      {/* Messages Dropdown Menu */}
      <li className="nav-item ">
        <a className="nav-link" data-toggle="dropdown" href="#">
          
          <span className="badge nav text-primary">① Isi Data</span>

          <span className="badge nav">―</span>

          <span className="badge nav">② Pembayaran</span>

          <span className="badge nav">―</span>

          <span className="badge nav">③ Peroses</span>

          <span className="badge nav">―</span>

          <span className="badge nav">④ E-Tiket Terbit</span>
        </a>
      </li>
    </ul>
  </div>
</nav>

    </div>
  )
}

export default Nav
