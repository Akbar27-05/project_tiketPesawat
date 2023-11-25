import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const FormKodePromo = () => {
  const [selectedOption, setSelectedOption] = useState("");
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
      Kode: "",
      PresentaseDiskon: "",
      MaksimumDiskon: "",
      BerlakuSampai: "",
      Deskripsi: "",
  });

  const [isUpdate, setIsUpdate] = useState(false);
  const [id, setId] = useState(false);

  useEffect(() => {
    const status = localStorage.getItem('selectKode');
    const data = JSON.parse(status);
    if (data) {
      setId(data.id)
      setIsUpdate(true);
      setFormData({ 
        Kode: data.Kode,
        PresentaseDiskon: data.PresentaseDiskon,
        MaksimumDiskon: data.MaksimumDiskon,
        BerlakuSampai: data.BerlakuSampai,
        Deskripsi: data.Deskripsi});
    }

  }, []);
  
  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    if (isUpdate) {
      axios
      .put(`http://127.0.0.1:8000/api/updateKode/${id}`, formData)
      .then((response) => {

        setSelectedOption("");
        setFormData({
          Kode: "",
          PresentaseDiskon: "",
          MaksimumDiskon: "",
          BerlakuSampai: "",
          Deskripsi: "",
        });

        localStorage.removeItem('selectKode');
        setIsUpdate(false);

        navigate("/adminPage/kodepromo");
      })
      .catch((error) => {
        console.log(error);
      });
    }else{
      axios
      .post("http://127.0.0.1:8000/api/kode", formData)
      .then((response) => {

        setSelectedOption("");
        setFormData({
          Kode: "",
          PresentaseDiskon: "",
          MaksimumDiskon: "",
          BerlakuSampai: "",
          Deskripsi: "",
        });

        navigate("/adminPage/kodepromo");
      })
      .catch((error) => {
        console.log(error);
      });
    }
  };

  const handleBack = () => {
    
    localStorage.removeItem('selectKode');
    setIsUpdate(false);
    navigate("/adminPage/kodepromo");

  };

  return (
    <body className="hold-transition register-page">
      <div className="register-box">
        <div className="card card-primary">
          <div className="card-header text-center">
            <a href="#" className="h1">
              <b>Bromo</b>AirLines
            </a>
          </div>
          <div className="card-body">
            <p className="text-center text-lg">Form Kode Promo</p>
            <form>
              <div className="d-flex flex-column">
                <div className="input-group mb-3">
                  <input
                    type="text"
                    name="Kode"
                    className="form-control"
                    placeholder="Kode Promo"
                    value={formData.Kode}
                    onChange={handleChange}
                    required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="date"
                    className="form-control"
                    placeholder="Berlaku Sampai"
                    name="BerlakuSampai"
                    value={formData.BerlakuSampai}
                    onChange={handleChange}
                    required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="number"
                    min={0}
                    className="form-control"
                    placeholder="Persentasi Diskon"
                    name="PresentaseDiskon"
                    value={formData.PresentaseDiskon}
                    onChange={handleChange}
                    required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="number"
                    min={0}
                    className="form-control"
                    placeholder="Maksimum Diskon"
                    name="MaksimumDiskon"
                    value={formData.MaksimumDiskon}
                    onChange={handleChange}
                    required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Deskripsi"
                    name="Deskripsi"
                    value={formData.Deskripsi}
                    onChange={handleChange}
                    required
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

export default FormKodePromo;
