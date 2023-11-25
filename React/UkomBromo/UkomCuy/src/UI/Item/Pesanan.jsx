import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";


const Pesanan = (props) => {
  const [data,setData] = useState([]);
  const [error,setEror] = useState("");

  const [dariID, setDariID] = useState("");
  const [keID, setKeID] = useState("");
  // const [tgl, setTgl] = useState("");
  const [penumpang, setPenumpang] = useState(1);

  const formatTodayDate = () => {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); // Menghindari masalah dengan indeks bulan yang dimulai dari 0
    const day = String(today.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  };
  
  const [tgl, setTgl] = useState(formatTodayDate());

  const handleDateChange = (e) => {
    const selectedDate = e.target.value;

    if (selectedDate >= formatTodayDate()) {
      setTgl(selectedDate);
    } else {
      setTgl(formatTodayDate());
    }
  };

  useEffect(() => {
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

    fetchData();
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();

    if (dariID === keID) {
      setEror("Bandara keberangkatan dan Bandara tujuan tidak boleh sama!");
      return;
    }
    localStorage.setItem('dariID', dariID);
    localStorage.setItem('keID', keID);
    localStorage.setItem('penumpang', penumpang);
    localStorage.setItem('tgl', tgl);

    console.log(dariID, keID, penumpang, tgl)
    window.location.href = "/userpage/caribandara";
  };

  // const [numAdults, setNumAdults] = useState(1);
  // const maxAdults = 7;

  // const [numChildren, setNumChildren] = useState(0);
  // const maxTotalPassengers = 7;

  // const [numInfants, setNumInfants] = useState(0);

  // const handleAdultsChange = (e) => {
  //   const value = parseInt(e.target.value, 10);

  //   if (!isNaN(value) && value >= 1 && value <= maxAdults) {
  //     const newTotalPassengers = value + numChildren;
  //     if (newTotalPassengers <= maxTotalPassengers) {
  //       setNumAdults(value);
  //       checkTotalPassengers(newTotalPassengers);
  //       checkInfantsLimit(value, numInfants);
  //     }
  //   }
  // };

  // const handleChildrenChange = (e) => {
  //   const value = parseInt(e.target.value, 10);
  //   if (!isNaN(value) && value >= 0) {
  //     const newTotalPassengers = numAdults + value;
  //     if (newTotalPassengers <= maxTotalPassengers) {
  //       setNumChildren(value);
  //       checkTotalPassengers(newTotalPassengers);
  //       checkInfantsLimit(numAdults, numInfants);
  //     }
  //   }
  // };

  // const handleInfantsChange = (e) => {
  //   const value = parseInt(e.target.value, 10);
  //   if (!isNaN(value) && value >= 0 && value <= numAdults) {
  //     setNumInfants(value);
  //     checkInfantsLimit(numAdults, value);
  //   }
  // };

  // const checkTotalPassengers = (totalPassengers) => {
  //   if (totalPassengers === maxTotalPassengers) {
  //     alert('Maksimum 7 jumlah penumpang (dewasa dan anak-anak) diizinkan.');
  //   }
  // };

  // const checkInfantsLimit = (adults, infants) => {
  //   if (infants > adults) {
  //     alert('Jumlah bayi tidak boleh melebihi jumlah dewasa.');
  //   }
  // };
  return (
      <div>
        <div className="content-wrapper">
          {/* Content Header (Page header) */}
          <div className="content-header">
            <div className="container-fluid">
              <h1 className="m-0">Pesanan Tiket</h1>
            </div>
          </div>

          <section className="content mt-3">
            <div className="container-fluid">
              <div className="card card-primary">
                <div className="card-header">
                  <h3 className="card-title">Cari tiket</h3>
                </div>
                <div className="card-body">
                  <div className="card-body">
                    <div className="row">
                      <div className="col-md-6">
                        <div className="form-group">
                          <label>Bandara Keberangkatan</label>
                          <select
                            className="form-control select2bs4"
                            style={{ width: "100%" }}
                            value={dariID}
                            onChange={(e) => setDariID(e.target.value)}
                            required
                          >
                            {data.map((item, index) => (
                            <option key={index} value={item.id}>
                              {item.Nama}
                            </option>
                            ))}
                          </select>
                        </div>

                        <div className="form-group">
                          <label>Tgl Keberangkatan</label>
                          <div className="form-group">
                            <div className="input-group">
                              <input type="date" className="form-control" 
                                value={tgl}
                                onChange={handleDateChange}
                                min={formatTodayDate()}
                                required
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      {/* /.col */}
                      <div className="col-md-6">
                        <div className="form-group">
                          <label>Bandara Tujuan</label>
                          <select
                            className="form-control select2bs4"
                            style={{ width: "100%" }}
                            value={keID}
                            onChange={(e) => setKeID(e.target.value)}
                            required
                          >
                            {data.map((item) => (
                            <option key={item.id} value={item.id}>
                              {item.Nama}
                            </option>
                            ))}
                          </select>
                        </div>

                        <div className="form-group">
                          <label>Jumlah Penumpang</label>
                          <input
                            type="number"
                            class="form-control"
                            placeholder="Jumlah Penumpang"
                            value={penumpang}
                            onChange={(e) => setPenumpang(e.target.value)}
                            required
                          />
                          {/* <div className="row">
                            <div className="col-md-4">
                              <label>Jumlah Penumpang Dewasa:</label>
                              <select className="form-control" value={numAdults} onChange={handleAdultsChange}>
                                {[...Array(maxAdults).keys()].map((num) => (
                                  <option key={num} value={num + 1}>
                                    {num + 1}
                                  </option>
                                ))}
                              </select>
                            </div>
                            <div className="col-md-4">
                              <label>Jumlah Penumpang Anak-anak:</label>
                              <select className="form-control" value={numChildren} onChange={handleChildrenChange}>
                              {[...Array(maxTotalPassengers - numAdults + 1).keys()].map((num) => (
                                  <option key={num} value={num}>
                                    {num}
                                  </option>
                                ))}
                              </select>
                            </div>
                            <div className="col-md-4">
                              <label>Jumlah Penumpang Bayi:</label>
                              <select className="form-control" value={numInfants} onChange={handleInfantsChange}>
                                {[...Array(numAdults + 1).keys()].map((num) => (
                                  <option key={num} value={num}>
                                    {num}
                                  </option>
                                ))}
                              </select>
                            </div>
                          </div> */}

                        </div>
                      </div>
                    </div>
                    <p className="text-danger">{error}</p>
                  </div>

                </div>
                <div className="card-footer">
                    <button onClick={handleSubmit} type="submit" class="btn btn-primary float-right">
                      Cari Penerbangan
                    </button>
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

export default Pesanan;
