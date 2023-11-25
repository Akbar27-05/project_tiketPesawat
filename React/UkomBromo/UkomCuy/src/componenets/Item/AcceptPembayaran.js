import axios from "axios";
import React, { useEffect, useState } from "react";
import { set } from "react-hook-form";
import { Link, useNavigate } from "react-router-dom";

const AcceptPembayaran = () => {
  const [data,setData] = useState([]);
  const [headerData,setHeaderData] = useState({});
  const [buttonDisabled, setButtonDisabled] = useState(false);
  
  const [fromDate, setFromDate] = useState('');
  const [toDate, setToDate] = useState('');
  // const [currentDate, setCurrentDate] = useState(new Date());
  const [filteredData, setFilteredData] = useState([]);

  const [formData, setFormData] = useState({
    AkunID: "",
    TanggalTransaksi: "",
    JadwalPenerbanganID: "",
    JumlahPenumpang: "",
    TotalHarga: "",
    KodePromoID: "",
    MetodePembayaran: "",
    TerimaPembayaran: ""
  });

  const config = {
    headers: {
      'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
    },
  };

  useEffect(() => {

    const TransaksiH = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/header");

        const sortedData = response.data.data.sort((a, b) => a.TerimaPembayaran - b.TerimaPembayaran);
        setData(sortedData);

        setFilteredData(response.data.data);

      } catch (error) {
        if (error.response && error.response.status === 429) {
          console.log("Rate Limit Exceeded");
        } else {
          console.error("An error occurred:", error);
        }
      }
    };

    TransaksiH();
    
  }, []);

  useEffect(() => {
    filterData();
  }, [fromDate, toDate]);
  // }, [data, currentDate, fromDate, toDate]);


  const filterData = () => {
    if (!fromDate || !toDate) {
      setFilteredData(data); // Menampilkan semua data jika tanggal tidak diinputkan
      // const filtered = data.filter(item => {
      //   const itemDate = new Date(item.TglTransaksi);
      //   return itemDate >= currentDate;
      // });
      // setFilteredData(filtered);
    } else {
      const filtered = data.filter(item => {
        const itemDate = new Date(item.TglTransaksi);
        const fromDateObj = new Date(fromDate);
        const toDateObj = new Date(toDate);
        return itemDate >= fromDateObj && itemDate <= toDateObj;
      });
      setFilteredData(filtered);
    }
  };
  
  const terima = (id) => {
    setShow(true);
    const ids = {
      id : id
    }

    axios.post('http://127.0.0.1:8000/api/getIdHeader',  ids, config )
      .then(response => {
        setHeaderData(response.data.data[0]);

      })
      .catch(error => {
        console.error('Login gagal', error);
      });

  }
  const [show, setShow] = useState(false);

  const handleConfirm = () => {
    setShow(false); 
        
    const dataPost = {
      AkunID: headerData.AkunID,
      TanggalTransaksi: headerData.TanggalTransaksi,
      JadwalPenerbanganID: headerData.JadwalPenerbanganID,
      JumlahPenumpang: headerData.JumlahPenumpang,
      TotalHarga: headerData.TotalHarga,
      KodePromoID: headerData.KodePromoID,
      MetodePembayaran: headerData.MetodePembayaran,
      TerimaPembayaran: 1
    }

      axios
      .put(`http://127.0.0.1:8000/api/updateHeader/${headerData.id}`, dataPost)
      .then((response) => {

        setFormData({
          AkunID: "",
          TanggalTransaksi: "",
          JadwalPenerbanganID: "",
          JumlahPenumpang: "",
          TotalHarga: "",
          KodePromoID: "",
          MetodePembayaran: "",
          TerimaPembayaran: ""
        });


        window.location.reload();
      })
      .catch((error) => {
        console.log(error);
      });
    
  };

  return (
      <div>
        <div className="content-wrapper">
          <div className="content-header">
            <div className="container-fluid d-flex justify-content-between">
              <h1 className="m-0">Accept Pembayaran</h1>
                
            </div>
          </div>

          <section className="content mt-3">
            <div className="container-fluid">
              <div className="card">
                <div className="card-header">
                  <h3 className="card-title"></h3>
                  <div className="card-tools">
                    <div
                      className="input-group input-group-sm"
                      style={{ width: 400 }}
                    >
                      <div className="input-group-append">
                        <div className="row">
                          <div className="cpl-6 d-flex">
                            <h5 className="mr-2 my-auto">Dari: </h5>
                            <input type="date"
        value={fromDate}
        onChange={e => setFromDate(e.target.value)}/>   

                          </div>
                          <div className="cpl-6 d-flex">
                            <h5 className="ml-3 mr-2 my-auto">Ke: </h5>
                            <input type="date" value={toDate}
        onChange={e => setToDate(e.target.value)} />

                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div className="card-body table-responsive p-0">
                  <table className="table table-hover text-nowrap">
                  <thead>
                    <tr className="text-center">
                        <th>Nama Pembeli</th>
                        <th>Kode Penerbangan</th>
                        <th>Maskapai</th>
                        <th>Bandara Keberangkatan</th>
                        <th>Bandara Tujuan</th>
                        <th>Tanggal Keberangkatan</th>
                        <th>Tanggal Transaksi</th>
                        <th>Metode Pembayaran</th>
                        <th>Durasi Penerbangan</th>
                      </tr>
                    </thead>
                    <tbody>
                      
                        {filteredData.map(item => (
                          <tr key={item.id} className="text-center">
                            <td>{item.Nama}</td>
                            <td>{item.KodePenerbangan}</td>
                            <td>{item.Maskapai}</td>
                            <td>{item.BandaraKeberangkatan}</td>
                            <td>{item.BandaraTujuan}</td>
                            <td>{item.TglKeberangkatan}</td>
                            <td>{item.TglTransaksi}</td>
                            <td>{item.MetodePembayaran}</td>
                            <td>{item.DurasiPenerbangan}</td>
                            <td>
                              {item.TerimaPembayaran === 0 ? (
                                <button onClick={()=>terima(item.HeadersID)} className="btn mr-2 btn-success" disabled={buttonDisabled}>Terima</button>
                              ) : (null)}
                              {show && (
                                <div className="modal fade show" role="dialog" style={{ display: 'block' }}>
                                  <div className="modal-dialog modal-dialog-centered" role="document">
                                    <div className="modal-content">
                                      <div className="modal-body mx-auto">
                                        <h4>Konfirmasi ulang</h4>
                                      </div>
                                      <div className="modal-footer mx-auto">
                                        <button
                                          type="button"
                                          className="btn btn-secondary"
                                          onClick={() => setShow(false)}
                                        >
                                          Kembali
                                        </button>
                                        <button
                                          type="button"
                                          className="btn btn-primary"
                                          onClick={handleConfirm}
                                        >
                                          Ya, Lanjutkan
                                        </button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              )}
                            </td>
                          </tr>
                          ))}
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
  );
};

export default AcceptPembayaran;