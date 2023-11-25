import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const MasterBandara = () => {
  const [data, setData] = useState([]);
  const navigate = useNavigate();

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

  const selectWhere = (id) => {
    const ids = {
      ID: id,
    };

    axios
      .post(`http://127.0.0.1:8000/api/selectBandara`, ids)
      .then((response) => {
        localStorage.setItem(
          "selectBandara",
          JSON.stringify(response.data.data[0])
        );

        navigate("/form/formbandara");
      })
      .catch((error) => {
        console.error("Gagal:", error);
      });
  };

  const del = (id) => {
    axios
      .delete(`http://127.0.0.1:8000/api/deleteBandara/${id}`)
      .then((response) => {
        console.log("Data berhasil dihapus:", response.data.message);
        window.location.reload();
      })
      .catch((error) => {
        console.error("Gagal menghapus data:", error);
      });
  };

  return (
    <div>
      <div className="content-wrapper">
        {/* Content Header (Page header) */}
        <div className="content-header">
          <div className="container-fluid d-flex justify-content-between">
            <h1 className="m-0">Master Bandara</h1>
            <Link to="/form/formbandara">
              <button className="btn btn-primary">Tambah Data</button>
            </Link>
          </div>
        </div>

        <section className="content mt-3">
          <div className="container-fluid">
            <div className="card">
              <div className="card-tools">
                <div className="card-header">
                  <h3 className="card-title"></h3>
                  
                </div>
              </div>
              {/* /.card-header */}
              <div className="card-body table-responsive p-0">
                <table className="table table-hover text-nowrap">
                  <thead>
                    <tr className="text-center">
                      <th>Nama</th>
                      <th>Kode IATA</th>
                      <th>Kota</th>
                      <th>Negara</th>
                      <th>Jumlah Terminal</th>
                      <th>Alamat</th>
                      <th>Tools</th>
                    </tr>
                  </thead>
                  <tbody>
                    {data.map((item, index) => (
                      <tr key={index} className="text-center">
                        <td>{item.Nama}</td>
                        <td>{item.KodeIATA}</td>
                        <td>{item.Kota}</td>
                        <td>{item.Negara}</td>
                        <td>{item.JumlahTerminal}</td>
                        <td>{item.Alamat}</td>
                        <td>
                          <button
                            onClick={() => selectWhere(item.id)}
                            className="btn mr-2 btn-success"
                          >
                            Edit
                          </button>
                          <button
                            onClick={() => del(item.id)}
                            className="btn btn-danger"
                          >
                            Delete
                          </button>
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

export default MasterBandara;
