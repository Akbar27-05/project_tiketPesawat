import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const TiketSaya = () => {
  const now = new Date();
  const [data,setData] = useState([]);
  const [data2,setData2] = useState([]);
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [currentDate, setCurrentDate] = useState(new Date());
  const [filteredData, setFilteredData] = useState([]);
    
  const navigate  = useNavigate();

  useEffect(() => {
    setIsLoggedIn(localStorage.getItem('isLoggedIn'));
    const akun = JSON.parse(localStorage.getItem('akun'));


    if (isLoggedIn) {

      setIsLoggedIn(true);
    }
      
    const idAkun = {
      AkunID : akun,
    }

      axios.post("http://127.0.0.1:8000/api/tiketSaya", idAkun)
      .then(response => {//tinggakl iki
        const d = response.data.data;
        setData(d);
      })
      .catch(error => {
        console.error('gagal', error);
      });
      
    const PerubahanJad = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/perubahan");
        setData2(response.data.data);
        
      } catch (error) {
        if (error.response && error.response.status === 429) {
          console.log("Rate Limit Exceeded");
        } else {
          console.error("An error occurred:", error);
        }
      }
    };

    PerubahanJad();
  }, []);
  
  const mergedData = data.map(item1 => {
    const matchingItem2 = data2.find(item2 => item2.JadwalID === item1.JadwalID);
    return { ...item1, ...matchingItem2 };
  });

  // useEffect(() => {
  //   filterData()
  // }, [mergedData, currentDate])

  // const filterData = () => {
  //   const filtered = mergedData.filter(item => {
  //     const itemDate = new Date(item.TglKeberangkatan);
  //     return itemDate >= currentDate;
  //   });
  //   setFilteredData(filtered);
  // }

  const cancelBooking = (id) => {
    axios
      .delete(`http://127.0.0.1:8000/api/deleteHeader/${id}`)
      .then((response) => {
        const isConfirmed = window.confirm('Anda yakin membatalkan Tiket?');
        if (isConfirmed) {
          window.location.reload();
        }else{

        }
      })
      .catch((error) => {
        console.error("Gagal menghapus data:", error);
      });
  }

  const etik = (id) => {
    navigate('/etiket')
  }
  
  return (
    <div className="content-wrapper">
      <div className="content-header">
        <div className="container-fluid">
          <h1 className="m-0">Tiket Saya</h1>
        </div>
      </div>
      {isLoggedIn ? (
        <section className="content mt-3">
        <div className="container-fluid">
          <div className="card">
            <div className="card-body table-responsive p-0">
              <table className="table table-hover text-nowrap">
                <thead>
                <tr className="text-center">
                      <th>Kode Penerbangan</th>
                      <th>Maskapai</th>
                      <th>Bandara Keberangkatan</th>
                      <th>Bandara Tujuan</th>
                      <th>Tanggal Keberangkatan</th>
                      <th>Status Penerbangan</th>
                      <th>Durasi Penerbangan</th>
                      <th>Status Terakhir</th>
                      {data.some((item) => (now - new Date(item.TglKeberangkatan)) / 60000 < item.DurasiPenerbangan) && (
                        <th>Terakhir Diubah</th>,
                        <th>Pembatalan</th>,
                        <th>Aksi</th>
                      )}
                  </tr>
                </thead>
                <tbody>
                  {
                  mergedData.map((item, index) => {
                    const departureTime = new Date(item.TglKeberangkatan);
                    const now = new Date();
                    const timeDifference = (now - departureTime) / 60000; // Menghitung selisih waktu dalam menit
          
                    let status;
                    if (timeDifference >= item.DurasiPenerbangan) {
                      status = "Penerbangan Telah Sampai";
                    } else if (departureTime <= now) {
                      status = "Telah Berangkat";
                    } else {
                      status = "Masih Menunggu";
                    }

                    const showButton = timeDifference < item.DurasiPenerbangan;
                    return (

                    <tr key={index} className="text-center">
                      <td>{item.KodePenerbangan}</td>
                      <td>{item.Maskapai}</td>
                      <td>{item.BandaraKeberangkatan}</td>
                      <td>{item.BandaraTujuan}</td>
                      <td>{item.TglKeberangkatan}</td>
                      <td className="text-bold">
                        {status}
                      </td>
                      <td>{item.DurasiPenerbangan}</td>
                      <td>{item.StatusPenerbangan ? `${item.StatusPenerbangan} (${item.WaktuDelay} Menit)` : ("Sesuai Jadwal")}</td>
                      <td>{item.WaktuPerubahanTerjadi ? (item.WaktuPerubahanTerjadi) : ("")}</td>
                      <td>
                        {item.TerimaPembayaran === 1 ? ("") : (<button onClick={() => cancelBooking(item.HeadersID)} className="btn mr-2 btn-danger">Cancel</button>)}
                      </td>
                      <td>
                      {showButton && item.TerimaPembayaran === 1 ? (
                        <button onClick={() => etik(item.id)} className="btn mr-2 btn-success">
                          Lihat Tiket
                        </button>
                      ) : showButton ? (
                        <p className="text-bold text-warning">Tiket sedang diproses</p>
                      ) : null}
                    </td>
                  </tr>
                  )})
                  }
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>
      ) : (
        <section className="content mt-3">
          <div className="container-fluid">
            <div className="card">
              <h2 className="mx-auto my-auto">Harus login terlebih dahulu</h2>
            </div>
          </div>
        </section>
      )}
    </div>
  );
};

export default TiketSaya;