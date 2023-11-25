import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const FormJadwalPenerbangan = () => {
    const [data, setData] = useState([]);
    const navigate = useNavigate();
    const [maskapai, setMaskapai] = useState([]);
    const [selectedOption, setSelectedOption] = useState("");

    const [kode, setKode] = useState("");
    const [dariID, setDariID] = useState("");
    const [keID, setKeID] = useState("");
    const [maskapaiID, setMaskapaiID] = useState("");
    const [tgl, setTgl] = useState("");
    const [jam, setJam] = useState("");
    const [durasi, setDurasi] = useState("");
    const [harga, setHarga] = useState("");

    const maskapaiData = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/maskapai");
        setMaskapai(response.data.data);
      } catch (error) {
        if (error.response && error.response.status === 429) {
          console.log("Rate Limit Exceeded");
        } else {
          console.error("An error occurred:", error);
        }
      }
    };

    const fetchData = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/bandara");
        setData(response.data.data);
      } catch (error) {
        if (error.response && error.response.status === 429) {
          console.log("Rate Limit Exceeded");
        } else {
          console.error("An error occurred:", error);
        }
      }
    };
  
    const [isUpdate, setIsUpdate] = useState(false);
    const [id, setId] = useState(false);

    useEffect(() => {
      const status = localStorage.getItem('selectJadwal');
      const data = JSON.parse(status);
      if (data) {
        const tanggal = new Date(data.TanggalWaktuKeberangkatan);
        const tahun = tanggal.getFullYear();
        const bulan = (tanggal.getMonth() + 1).toString().padStart(2, '0'); 
        const tanggalDalamBentukString = tanggal.getDate().toString().padStart(2, '0');

        const tanggalDalamFormatInput = `${tahun}-${bulan}-${tanggalDalamBentukString}`;

        const jamDalamFormatBaru = tanggal.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });

        setId(data.id)
        setIsUpdate(true);
        setKode( data.KodePenerbangan );
        setDariID( data.BandaraKeberangkatanID );
        setKeID( data.BandaraTujuanID );
        setMaskapaiID( data.MaskapaiID );
        setTgl( tanggalDalamFormatInput );
        setJam( jamDalamFormatBaru );
        setDurasi( data.DurasiPenerbangan );
        setHarga( data.HargaPerTiket );

      }
        maskapaiData();
        fetchData();
    }, []);

  const handleSubmit = (e) => {
    e.preventDefault();

    const jadwal = new FormData();
    jadwal.append("KodePenerbangan", kode);
    jadwal.append("BandaraKeberangkatanID", dariID);
    jadwal.append("BandaraTujuanID", keID);
    jadwal.append("MaskapaiID", maskapaiID);
    jadwal.append("TanggalWaktuKeberangkatan", tgl+" "+jam+":00");
    jadwal.append("DurasiPenerbangan", durasi);
    jadwal.append("HargaPerTiket", harga);

    if (isUpdate) {
  
      axios
        .post(`http://127.0.0.1:8000/api/updateJadwal/${id}`, jadwal)
        .then((response) => {
          console.log(jadwal);
  
          localStorage.removeItem('selectJadwal');
          setIsUpdate(false);
  
          navigate("/adminPage/jadwalPenerbangan");
          alert("Jadwal Updated");
        })
        .catch((error) => {
          console.log(error);
        });

    }else{
  
      axios
        .post("http://127.0.0.1:8000/api/jadwal", jadwal)
        .then((response) => {
          console.log(jadwal);
  
          navigate("/adminPage/jadwalPenerbangan");
          alert(response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    }
  };
  
  const handleBack = () => {
    localStorage.removeItem('selectJadwal');
    setIsUpdate(false);
    navigate("/adminPage/jadwalPenerbangan");
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
            <p className="text-center text-lg">Form Jadwal Penerbangan</p>
            <form>
              <div className="d-flex flex-column">
                <div className="input-group mb-3">
                  <input
                    name="KodePenerbangan"
                    type="text"
                    className="form-control"
                    value={kode}
                    onChange={(e) => setKode(e.target.value)}
                    placeholder="XX-0000"
                    required
                  />
                  
                </div>
                <div className="input-group mb-3">
                  <div className="input-group m-auto">
                    <select
                      name="BandaraKeberangkatanID"
                      className="form-control select"
                      style={{ width: "100%" }}
                      value={dariID}
                      onChange={(e) => setDariID(e.target.value)}
                      required
                    >
                      <option className="" selected="selected" disabled>
                        Bandara
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
                  <div className="input-group m-auto">
                    <select
                      name="BandaraTujuanID"
                      className="form-control select"
                      style={{ width: "100%" }}
                      value={keID}
                      onChange={(e) => setKeID(e.target.value)}
                      required
                    >
                      <option className="" selected="selected" disabled>
                        Bandara
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
                  <div className="input-group m-auto">
                    <select
                      name="MaskapaiID"
                      className="form-control select"
                      style={{ width: "100%" }}
                      value={maskapaiID}
                      onChange={(e) => setMaskapaiID(e.target.value)}
                      required
                    >
                      <option className="" selected="selected" disabled>
                        Maskapai
                      </option>
                      {maskapai.map((item) => (
                        <option key={item.id} value={item.id}>
                          {item.Nama}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="date"
                    className="form-control"
                    placeholder="Tanggal"
                    value={tgl}
                    onChange={(e) => setTgl(e.target.value)}
                    required
                  />
                  <div className="input-group-append"></div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Waktu Keberangkatan"
                    value={jam}
                    onChange={(e) => setJam(e.target.value)}
                    required
                  />
                  <div className="input-group-append"></div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Durasi dalam Menit"
                    value={durasi}
                    onChange={(e) => setDurasi(e.target.value)}
                    required
                  />
                  <div className="input-group-append"></div>
                </div>
                <div className="input-group mb-3">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Harga Tiket"
                    value={harga}
                    onChange={(e) => setHarga(e.target.value)}
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

export default FormJadwalPenerbangan;
