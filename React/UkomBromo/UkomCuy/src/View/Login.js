import React, { useState } from 'react'
import Logo from '../App Logo Alt.png';
import './Login.css';
import { Link, Navigate, useNavigate } from 'react-router-dom';
import axios from 'axios';
import ReCAPTCHA from 'react-google-recaptcha';


const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [recapToken, setRecapToken] = useState(false);

  const navigate = useNavigate();

  const isPemesanan = localStorage.getItem('isPemesanan');

  const postData = {
    Username: username,
    Password: password,
  };
  
  const config = {
    headers: {
      'Content-Type': 'multipart/form-data;', // Tipe konten permintaan
    },
  };

  const handleLogin = (event) => {
    event.preventDefault();

    const cap = localStorage.getItem('_grecaptcha');
    if (cap) {
      axios.post('http://127.0.0.1:8000/api/login',  postData, config )
      .then(response => {
        console.log(response.data.data[0]);
        localStorage.setItem('akun', JSON.stringify(response.data.data[0]));
        localStorage.setItem('isLoggedIn', 'true');

        if (response.data.data[0].MerupakanAdmin === "1") {

          localStorage.setItem('isAdmin', 'true');
          navigate("/adminpage");
        }else{
          if (isPemesanan) {
            navigate("/pemesanan");
            localStorage.removeItem('isPemesanan')
          }else{
            navigate("/userpage");
          }
        }
      })
      .catch(error => {
        console.error('Login gagal', error);
      });
    }else{
      alert("Pencet Kotak woy!!!");
    }
    
  };


  return (
    <div class='hold-transition register-page'>
    <div className="login-box">
  <div className="login-logo">
    <a href=""><b>Bromo</b> Airlines</a>
  </div>
  {/* /.login-logo */}
  <div className="card">
    <div className="card-body login-card-body">
      <p className="login-box-msg">Masuk akun Anda</p>
      <img src={Logo} alt="" className='gambar-logo mb-3' />
      <form >
        <div className="input-group mb-3">
          <input type="text" className="form-control" placeholder="Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)} />
          <div className="input-group-append">
            <div className="input-group-text">
            </div>
          </div>
        </div>
        <div className="input-group mb-3">
          <input type="password" className="form-control" placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)} />
          <div className="input-group-append">
            <div className="input-group-text">
            </div>
          </div>
        </div>

        <ReCAPTCHA className=' my-2' sitekey='6LesVuooAAAAABsOnB1eRknj-jS-dpGM2S5eenaS' onChange={()=>setRecapToken(true)}/>
        


          {/* /.col */}
          <div className="justify-content-center">
            <button onClick={handleLogin} type="submit" className="btn btn-primary btn-block text-center">
              Login</button>
          </div>
          {/* /.col */}
      </form>
      <p className="my-2 text-center">
        <Link to={'/register'}>
        <a >Daftar akun baru</a>
        </Link>
      </p>
    </div>
    {/* /.login-card-body */}
  </div>
</div>
</div>
  )
}

export default Login