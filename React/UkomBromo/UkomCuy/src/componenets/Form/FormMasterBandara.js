import axios from "axios";
import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

const FormMasterBandara = () => {
  const [data, setData] = useState([]);
  const navigate = useNavigate();
  const [selectedOption, setSelectedOption] = useState("");
  
  const [formData, setFormData] = useState({
    Nama: "",
    KodeIATA: "",
    Kota: "",
    NegaraID: "",
    JumlahTerminal: "",
    Alamat: "",
  });
  
  const [isUpdate, setIsUpdate] = useState(false);
  const [id, setId] = useState(false);

  const fetchData = async () => {
    try {
      const response = await axios.get("http://127.0.0.1:8000/api/negara");
      setData(response.data.data);
    } catch (error) {
      if (error.response && error.response.status === 429) {
        console.log("Rate Limit Exceeded");
      } else {
        console.error("An error occurred:", error);
      }
    }
  };

  useEffect(() => {
    const status = localStorage.getItem('selectBandara');
    const bandaraData = JSON.parse(status);
    if (bandaraData) {
      setId(bandaraData.id)
      setIsUpdate(true);
      setFormData({ 
        Nama: bandaraData.Nama,
        KodeIATA: bandaraData.KodeIATA,
        Kota: bandaraData.Kota,
        NegaraID: bandaraData.NegaraID,
        JumlahTerminal: bandaraData.JumlahTerminal,
        Alamat: bandaraData.Alamat,});
    }


    fetchData();
  }, []);


  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    if (isUpdate) {
      axios
      .post(`http://127.0.0.1:8000/api/updateBandara/${id}`, formData)
      .then((response) => {
        console.log(response.data);

        setFormData({
          Nama: "",
          KodeIATA: "",
          Kota: "",
          NegaraID: "",
          JumlahTerminal: "",
          Alamat: "",
        });
        
        localStorage.removeItem('selectBandara');
        setIsUpdate(false);

        navigate("/adminPage/masterbandara");
      })
      .catch((error) => {
        console.log(error);
      });
    }
    else{
      axios
      .post("http://127.0.0.1:8000/api/bandara", formData)
      .then((response) => {
        console.log(formData);

        setSelectedOption("");
        setFormData({
          Nama: "",
          KodeIATA: "",
          Kota: "",
          NegaraID: "",
          JumlahTerminal: "",
          Alamat: "",
        });

        navigate("/adminPage/masterbandara");
        alert(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
    }
  };

  const handleBack = () => {
    localStorage.removeItem('selectBandara');
    setIsUpdate(false);
    
    navigate("/adminPage/masterbandara");
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
            <p className="text-center text-lg">Form Master Bandara</p>
            <form>
              <div className="d-flex flex-column">
                <div className="input-group mb-3">
                  <input
                    type="text"
                    name="Nama"
                    className="form-control"
                    placeholder="Nama"
                    value={formData.Nama}
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
                    name="KodeIATA"
                    className="form-control"
                    placeholder="Kode IATA"
                    value={formData.KodeIATA}
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
                    name="Kota"
                    className="form-control"
                    placeholder="Kota"
                    value={formData.Kota}
                    onChange={handleChange}
                    required
                  />
                  <div className="input-group-append">
                    <div className=""></div>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <div className="input-group m-auto">
                    <select
                      name="NegaraID"
                      className="form-control select"
                      style={{ width: "100%" }}
                      value={formData.NegaraID}
                      onChange={handleChange}
                      required
                    >
                      <option className="" selected="selected" disabled>
                        Negara
                      </option>
                      {data.map((item) => (
                        <option key={item.id} value={item.id}>
                          {item.Nama}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="number"
                    name="JumlahTerminal"
                    min={0}
                    className="form-control"
                    placeholder="Jumlah Terminal"
                    value={formData.JumlahTerminal}
                    onChange={handleChange}
                    required
                  />
                  <div className="input-group-append"></div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    name="Alamat"
                    className="form-control"
                    placeholder="Alamat"
                    value={formData.Alamat}
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

export default FormMasterBandara;
