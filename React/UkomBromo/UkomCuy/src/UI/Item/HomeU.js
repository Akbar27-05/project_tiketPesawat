import React, { useState } from "react";
import { Link } from "react-router-dom";
import Pesan from '../../Resources/Icons/purchase-tag-alt-selected-72.png'
import TSaya from '../../Resources/Icons/airplane-ticket-black.png'

const HomeU = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const akun = JSON.stringify(localStorage.getItem('akun')); 
  const statusLogin = localStorage.getItem('isLoggedIn');
  return (
      <div>
        <div className="content-wrapper">
          {/* Content Header (Page header) */}
          <div className="content-header">
            <div className="container-fluid">
              <h1 className="m-0">Welcome</h1>
            </div>
            {/* /.container-fluid */}
          </div>

          {/* /.content-header */}
          {/* Main content */}
          <section className="content mt-3">
            <div className="container-fluid">
              <div className="row">
                <div className="col-lg-6 col-12">
                  {/* small box */}
                  <div className="small-box bg-info">
                    <div className="inner">
                      <h3> </h3>
                      <h4>Pesan Tiket</h4>
                    </div>
                    <div className="icon">
                      <i className="ion ion-bag"/>
                    </div>
                    <Link to="/userpage/pesanan" className="small-box-footer">
                      More info <i className="fas fa-arrow-circle-right" />
                    </Link>
                  </div>
                </div>
                {/* ./col */}
                <div className="col-lg-6 col-12">
                  {/* small box */}
                  <div className="small-box bg-success">
                    <div className="inner">
                      <h3>
                       
                      </h3>
                      <h4>Tiket Saya</h4>
                    </div>
                    <div className="icon">
                      <i className="fa fa-ticket"/>
                    </div>
                    <Link to="/userpage/tiketsaya" className="small-box-footer">
                      More info <i className="fas fa-arrow-circle-right" />
                    </Link>
                  </div>
                </div>
              </div>
            </div>
            {/* /.container-fluid */}
          </section>
          {/* /.content */}
        </div>
      </div>
  );
};

export default HomeU;
