import React, { useState } from "react";
import "./Register.css";
import Logo from "../Resources/WithPadding/Logo Rect.png";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";

const Register = () => {
  const navigate = useNavigate();
    const [usr, setUsr] = useState("");
    const [pass, setPass] = useState("");
    const [nama, setNama] = useState("");
    const [tgl, setTgl] = useState("");
    const [no, setNo] = useState("");

    const handleChange = (e) => {
      setNama(e.target.value);
    }

  const handleSubmit = (e) => {
    
    e.preventDefault();
    if (/\d/.test(nama)) {
      alert('Nama tidak boleh mengandung angka.');
    }else{
      const reg = new FormData();
      reg.append("Username", usr);
      reg.append("Password", pass);
      reg.append("Nama", nama);
      reg.append("TanggalLahir", tgl);
      reg.append("NomorTelepon", no);
      reg.append("MerupakanAdmin", "0");
  
      axios
        .post('http://127.0.0.1:8000/api/akun', reg)
        .then((response) => {
          console.log(reg);
  
          navigate("/login");
          alert(response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    };
  };
  
  const handleBack = () => {
    navigate("/login");
  };

  return (
    <div class="hold-transition register-page">
      <div className="register-box">
        <div className="register-logo">
          <a href="#">
            <b>Bromo </b>AirLines
          </a>
        </div>
        <div className="card">
          <div className="card-body register-card-body">
            <p className="login-box-msg">Register a new Account</p>
            <img src={Logo} alt="" className="gambar mb-3" />
            <form>
              <div className="input-group mb-3">
                <input
                  type="text"
                  className="form-control"
                  placeholder="Nama"
                  name="Nama"
                  value={nama}
                  onChange={(handleChange) => setNama(handleChange.target.value)}
                  required
                />
              </div>
              <div className="input-group mb-3">
                <input
                  type="text"
                  className="form-control"
                  placeholder="Username"
                  name="Username"
                  value={usr}
                  onChange={(e) => setUsr(e.target.value)}
                  required
                />
              </div>
              <div class="d-flex col-3lg">
                <div className="input-group mb-3">
                  <input
                    type="date"
                    className="form-control"
                    placeholder="Tanggal Lahir"
                    name="TanggalLahir"
                    value={tgl}
                    onChange={(e) => setTgl(e.target.value)}
                    required
                  />
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Telp"
                    name="NomorTelepon"
                    value={no}
                    onChange={(e) => setNo(e.target.value)}
                    required
                  />
                  
                </div>
              </div>
              <div className="input-group mb-3 ">
                <input
                  type="password"
                  className="form-control"
                  placeholder="Password"
                  name="Password"
                  value={pass}
                  onChange={(e) => setPass(e.target.value)}
                  required
                />
              </div>

              <div className="input-group d-flex justify-content-between">
                <div className="">
                  <button
                    type="submit"
                    className="btn btn-success"
                    onClick={handleSubmit}>
                    Register
                  </button>
                </div>
                <a href="" type="submit" onClick={handleBack}>Sudah Punya Akun?</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Register;