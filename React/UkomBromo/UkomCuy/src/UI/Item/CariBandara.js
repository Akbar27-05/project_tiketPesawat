import "./CariBandara.css";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const CariBandara = () => {
  const [data,setData] = useState([]);
  const [error,setEror] = useState("");
  const [sortedProducts, setSortedProducts] = useState([]);
  const [sortOrder, setSortOrder] = useState('ascending'); 
  const [sortDurasi, setSortDurasi] = useState(''); 

  const navigate = useNavigate();

  const [dariID,setDari] = useState(localStorage.getItem('dariID'));
  const [keID,setKe] = useState(localStorage.getItem('keID'));
  const [plngn,setPlngn] = useState(localStorage.getItem('penumpang'));
  const [tgl,setTgl] = useState(localStorage.getItem('tgl'));

  const [keberangkatan,setKeberangkatan] = useState('');
  const [tujuan,setTujuan] = useState('');

  const config = {
    headers: {
      'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
    },
  };

  const transaksi = (id) => {
    
    const cariID = {
      id: id,
    };

    axios.post('http://127.0.0.1:8000/api/selectIdJadwal',  cariID, config )
      .then(response => {
        localStorage.setItem('selectJadwal', JSON.stringify(response.data.data[0]));

        navigate('/pemesanan')
      })
      .catch(error => {
        console.error('Login gagal', error);
      });
  }

  const dariData = {
    ID: dariID,
  };
  const keData = {
    ID: keID,
  };
  const cari = {
    BandaraKeberangkatanID: dariID,
    BandaraTujuanID: keID,
  };

  
  const dari = async () => {
    axios.post('http://127.0.0.1:8000/api/selectBandara',  dariData, config )
      .then(response => {
        setKeberangkatan(response.data.data[0]);
      })
      .catch(error => {
        console.error('Login gagal', error);
      });
  };

  const ke = async () => {
    axios.post('http://127.0.0.1:8000/api/selectBandara',  keData, config )
      .then(response => {
        setTujuan(response.data.data[0]);
      })
      .catch(error => {
        console.error('Login gagal', error);
      });
  };


  const bandara = async () => {
    if (dariID === keID) {
      setEror("Bandara keberangkatan dan Bandara tujuan tidak boleh sama!");
      return;
    }

    try {
      const response = await axios.post("http://127.0.0.1:8000/api/cariBandara", cari, config);
      setData(response.data.data);
      setSortedProducts(response.data.data)
    } catch (error) {
      if (error.response && error.response.status === 429) {
        console.log("Rate Limit Exceeded");
      } else {
        console.error("An error occurred:", error);
      }
    }
  };

  useEffect(() => {
    sortProducts(sortOrder)
  }, [data, tgl, sortOrder])

  const handleSortChange = (event) => {
    const newSortOrder = event.target.value;
    setSortOrder(newSortOrder);
    setSortDurasi(newSortOrder);
    sortProducts(newSortOrder);
  };

const sortProducts = (newSortOrder) => {
  const filtered = data.filter(item => {
    const itemDate = new Date(item.TanggalWaktuKeberangkatan);
    const formattedDate = itemDate.toISOString().split('T')[0]; 
    return formattedDate === tgl;
  });

    const sortedData = [...filtered];
    if (newSortOrder === 'ascending') {
      sortedData.sort((a, b) => a.HargaPerTiket - b.HargaPerTiket);
    }if (newSortOrder === 'durasi') {
      sortedData.sort((a, b) => a.DurasiPenerbangan - b.DurasiPenerbangan);
    }
    else if (newSortOrder === 'descending'){
        sortedData.sort((a, b) => b.HargaPerTiket - a.HargaPerTiket);
    }
    setSortedProducts(sortedData);
};

  useEffect(() => {
    dari();
    ke();
    bandara();
  }, []);
  return (
      <div>
        <div className="content-wrapper">
            <div className="content-header">
                <div className="container-fluid">
                <h1 className="m-0">Pesanan Tiket</h1>
                </div>
            </div>
            <div className=" Awalsendiri">
                <div className=" bandara">
                  <ul className="tujuan">
                    <li className="awal text-white">{keberangkatan.Nama} ({keberangkatan.KodeIATA})<i className="Panah text-white">→</i> </li>
                    <li className="akhir text-white">{tujuan.Nama} ({tujuan.KodeIATA})</li>
                  </ul>
                  <ul className="keberangkatan">
                    <li className="tanggal text-white">{tgl} <i className="PanahAtas text-white">|</i> </li>
                    <li className="penumpang text-white">{plngn} Penumpang</li>
                  </ul>
                </div>

                <div className="filter">
                    <div className="form-group filter1">
                      <h1 className="text-md flies">Filter :</h1>
                      <select alue={sortOrder} onChange={handleSortChange} className=" h-10 w-full rounded-lg border-2 border-secondary ">
                       
                          <option value="ascending">Harga Terendah</option>
                          <option value="descending">Harga Tertinggi</option>
                          <option value="durasi">Durasi Tercepat</option>
                      </select>
                    </div>
                </div> 
            </div>

                <div className="card-header Carisesuatu">
                  <h3 className="card-title">Cari Bandara</h3>
                </div>
                <section className="content">
            <div className="container-fluid">
              <div className="card">
                {/* /.card-header */}
                <div className="card-body table-responsive p-0">
                  {error ? `<p>${error}</p>` : (
                  <table className="table table-hover">
                    <thead>
                    <tr className="text-center">
                        <th>Kode Penerbangan</th>
                        <th>Bandara Keberangkatan</th>
                        <th>Bandara Tujuan</th>
                        <th>Maskapai</th>
                        <th>Tanggal Keberangkatan</th>
                        <th>Durasi Penerbangan</th>
                        <th>Harga Tiket</th>
                        <th>Option</th>
                      </tr>
                    </thead>
                    <tbody>
                      {sortedProducts.map((item, index) => (
                        <tr key={index}>
                          <td>{item.KodePenerbangan}</td>
                          <td>{item.BandaraKeberangkatan}</td>
                          <td>{item.BandaraTujuan}</td>
                          <td>{item.Maskapai}</td>
                          <td>{item.TanggalWaktuKeberangkatan}</td>
                          <td>{item.DurasiPenerbangan}</td>
                          <td>{item.HargaPerTiket}</td>
                          <td>
                            <button className="btn mr-2 btn-info" onClick={()=>transaksi(item.id)}>Beli</button>
                          
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                  )}
                </div>
              </div>
            </div>
          </section>
        </div>
    </div>
  );
};

export default CariBandara;