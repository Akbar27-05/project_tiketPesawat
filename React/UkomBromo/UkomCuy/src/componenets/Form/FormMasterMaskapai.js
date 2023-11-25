import axios from "axios";
import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const FormMasterMaskapai = () => {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);

  const [formData, setFormData] = useState({
    Nama:'',
    Perusahaan:'',
    JumlahKru:'',
    Deskripsi:''
  });
  
  const [isUpdate, setIsUpdate] = useState(false);
  const [id, setId] = useState(false);
  

  useEffect(()=>{
    const status = localStorage.getItem('selectMaskapai');
    const maskapaiData = JSON.parse(status);
    if (maskapaiData) {
      setId(maskapaiData.id)
      setIsUpdate(true);
      setFormData({ 
        Nama: maskapaiData.Nama,
        Perusahaan: maskapaiData.Perusahaan,
        JumlahKru: maskapaiData.JumlahKru,
        Deskripsi: maskapaiData.Deskripsi});
    }

  }, []);

  const handleChange = (event) => {
      const {name, value} = event.target;
      setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = (event) => {
      event.preventDefault();
    if (isUpdate) {
      axios.put(`http://127.0.0.1:8000/api/updateMaskapai/${id}`, formData)
        .then(response => {

            setFormData({
                Nama:'',
                Perusahaan:'',
                JumlahKru:'',
                Deskripsi:''
            })
            
            localStorage.removeItem('selectMaskapai');
            setIsUpdate(false);
            
            navigate("/adminpage/mastermaskapai");
        })
        .catch(error => {
            console.log(error);
        })

    } else {
      axios.post('http://127.0.0.1:8000/api/maskapai', formData)
        .then(response => {

            setFormData({
                Nama:'',
                Perusahaan:'',
                JumlahKru:'',
                Deskripsi:''
            })
            
            navigate("/adminpage/mastermaskapai");
        })
        .catch(error => {
            console.log(error);
        })
    }
  }

  const handleBack = () => {
    
    localStorage.removeItem('selectMaskapai');
    setIsUpdate(false);
    navigate("/adminpage/mastermaskapai");
  };

  return (
    <body className="hold-transition register-page">
      <div className="register-box">
        <div className="card card-secondary">
          <div className="card-header text-center">
            <a href="#" className="h1">
              <b>Bromo</b>AirLines
            </a>
          </div>
          <div className="card-body">
            <p className="text-center text-lg">Form Master Maskapai</p>
            <form >
              <div className="d-flex flex-column">
                <div className="input-group mb-3">
                  <input
                    type="text"
                    name="Nama"
                    className="form-control"
                    placeholder="Nama"
                    value={formData.Nama}
                    onChange={handleChange} required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    name="Perusahaan"
                    className="form-control"
                    placeholder="Perusahaan"
                    value={formData.Perusahaan}
                    onChange={handleChange} required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="number"
                    name="JumlahKru"
                    className="form-control"
                    placeholder="Jumlah Kru"
                    value={formData.JumlahKru}
                    onChange={handleChange} required
                  />
                  <div className="input-group-append"></div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    name="Deskripsi"
                    className="form-control"
                    placeholder="Deskripsi"
                    value={formData.Deskripsi}
                    onChange={handleChange} required
                  />
                  <div className="input-group-append"></div>
                </div>
              </div>
              <div className="input-group d-flex justify-content-between">
                <div>
                  <button
                    type="submit"
                    className="btn btn-success"
                    onClick={handleSubmit}
                  >
                    {isUpdate ? "Update" : "Insert"}
                  </button>
                </div>
                <div>
                  <button
                    type="submit"
                    className="btn btn-primary btn-info"
                    onClick={handleBack}
                  >
                    Kembali
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </body>
  );
};

export default FormMasterMaskapai;
