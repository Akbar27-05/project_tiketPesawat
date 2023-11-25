import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import moment from 'moment-timezone';

const UbahStatus = () => {
  const [data,setData] = useState([]);
  const [data2,setData2] = useState([]);
  const [idJad,setIdJad] = useState(0);
  const [showForm, setShowForm] = useState(false);
  const [selectedOption, setSelectedOption] = useState('');
  const [textInput, setTextInput] = useState('');

  useEffect(() => {

    const TransaksiH = async () => {
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

    TransaksiH();
    PerubahanJad();
  }, []);
  const mergedData = data.map(item1 => {
    const matchingItem2 = data2.find(item2 => item2.JadwalID === item1.id);
    return { ...item1, ...matchingItem2 };
  });

  const edit = (id) =>{
    setShowForm(true)
    setIdJad(id);
  }

  const handleOptionChange = (e) => {
    setSelectedOption(e.target.value);
  };

  const handleTextChange = (e) => {
    setTextInput(e.target.value);
  };

  const handleCancle = () => {
    setShowForm(false)

    setSelectedOption('');
    setTextInput('');
  }

  const handleSubmit = () => {
    console.log('Selected Option:', selectedOption);
    console.log('Text Input:', textInput);
    const options = {
      timeZone: 'Asia/Jakarta',
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
    };

    const currentDateTime = new Date().toLocaleString('id-ID', options);

    const post = {
      'JadwalPenerbanganID' : idJad,
      'StatusPenerbanganID' : selectedOption,
      'WaktuPerubahanTerjadi' : currentDateTime,
      'PerkiraanWaktuDelay' : textInput
    }

    axios.post('http://127.0.0.1:8000/api/perubahan',  post )
    .then(response => {

      setShowForm(false)
      window.location.reload();
    })
    .catch(error => {
      console.error('Error', error);
      alert('error')
    });
  };


  return (
      <div>
        <div className="content-wrapper">
          <div className="content-header">
            <div className="container-fluid d-flex justify-content-between">
              <h1 className="m-0">Ubah Status Penerbangan</h1>
                
            </div>


            <div className="content-header">
            {showForm && (
              <div className="mt-2 ">
                <div className="row ">
                  <select
                    className="form-control mx-2 col-4"
                    value={selectedOption}
                    onChange={handleOptionChange}
                  >
                    <option value="" disabled defaultChecked>Pilih Status</option>
                    <option value="1">Sesuai Jadwal</option>
                    <option value="2">Delay</option>
                  </select>
        
                  {selectedOption === '2' && (
                    <input
                      className="form-control col-4"
                      type="number"
                      placeholder="Masukkan berapa menit delay dari Waktu dijadwal"
                      value={textInput}
                      onChange={handleTextChange}
                    />
                  )}
                </div>
    
                <div className="row mt-2">
                  <button
                    className="btn btn-secondary col-1 ml-2"
                    onClick={handleCancle}
                  >
                    Batal
                  </button>
                  <button
                    className="btn btn-warning col-1  mx-3"
                    onClick={handleSubmit}
                  >
                    Kirim
                  </button>
                </div>
              </div>
            )}
            </div>
          </div>
          
          <section className="content mt-1">
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
                        <th>Maskapai</th>
                        <th>Bandara Keberangkatan</th>
                        <th>Bandara Tujuan</th>
                        <th>Tanggal Keberangkatan</th>
                        <th>Durasi Penerbangan</th>
                        <th>Status Terakhir</th>
                        <th>Terakhir Diubah</th>
                        <th>Tools</th>
                      </tr>
                    </thead>
                    <tbody>
                      {
                        mergedData.map((item, index) => (
                          <tr key={index} className="text-center">
                            <td>{item.KodePenerbangan}</td>
                            <td>{item.Maskapai}</td>
                            <td>{item.BandaraKeberangkatan}</td>
                            <td>{item.BandaraTujuan}</td>
                            <td>{item.TanggalWaktuKeberangkatan}</td>
                            <td>{item.DurasiPenerbangan}</td>
                            <td>{item.StatusPenerbangan ? (item.StatusPenerbangan) : ("Sesuai Jadwal")}</td>
                            <td>{item.WaktuPerubahanTerjadi ? (item.WaktuPerubahanTerjadi) : ("")}</td>
                            <td>
                              <button onClick={() => edit(item.id)} className="btn mr-2 btn-success">Edit</button>
                            </td>
                          </tr>
                        ))
                      }
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

export default UbahStatus;