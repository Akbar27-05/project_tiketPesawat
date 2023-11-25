import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const JadwalPenerbangan = () => {
  const [data,setData] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get("http://127.0.0.1:8000/api/jadwal");
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

  const selectWhere = (id) =>{

    const ids ={
      id: id
    }

    axios.post(`http://127.0.0.1:8000/api/selectIdJadwal`, ids)
      .then((response) => {
        localStorage.setItem("selectJadwal", JSON.stringify(response.data.data[0]))

        navigate('/form/formjadwal');
      })
      .catch((error) => {
        console.error('Gagal:', error);
      });
  }

  const del = (id) =>{

    axios.delete(`http://127.0.0.1:8000/api/deleteJadwal/${id}`)
      .then((response) => {
        console.log('Data berhasil dihapus:', response.data.message);
        window.location.reload();
      })
      .catch((error) => {
        console.error('Gagal menghapus data:', error);
      });
  }

  return (
      <div>
        <div className="content-wrapper">
          <div className="content-header">
            <div className="container-fluid d-flex justify-content-between">
              <h1 className="m-0">Master Jadwal Penerbangan</h1>
              <Link to='/form/formjadwal'>
                  <button className="btn btn-primary">Tambah Data</button>
                </Link>
            </div>
          </div>

          <section className="content mt-3">
            <div className="container-fluid">
              <div className="card">
                <div className="card-header">
                  <h3 className="card-title"></h3>
                  
                </div>
                <div className="card-body table-responsive p-0">
                  <table className="table table-hover text-nowrap">
                    <thead>
                    <tr className="text-center">
                        <th>Kode Penerbangan</th>
                        <th>Bandara Keberangkatan</th>
                        <th>Bandara Tujuan</th>
                        <th>Maskapai</th>
                        <th>Tanggal Keberangkatan</th>
                        <th>Durasi Penerbangan</th>
                        <th>Harga Per Tiket</th>
                        <th>Option</th>
                      </tr>
                    </thead>
                    <tbody>
                      {data.map((item, index) => (
                        <tr key={index} className="text-center">
                          <td>{item.KodePenerbangan}</td>
                          <td>{item.BandaraKeberangkatan}</td>
                          <td>{item.BandaraTujuan}</td>
                          <td>{item.Maskapai}</td>
                          <td>{item.TanggalWaktuKeberangkatan}</td>
                          <td>{item.DurasiPenerbangan}</td>
                          <td>{item.HargaPerTiket}</td>
                          <td>
                            <button onClick={()=>selectWhere(item.id)} className="btn mr-2 btn-success">Edit</button>
                            <button onClick={()=>del(item.id)} className="btn btn-danger">Delete</button>
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

export default JadwalPenerbangan;