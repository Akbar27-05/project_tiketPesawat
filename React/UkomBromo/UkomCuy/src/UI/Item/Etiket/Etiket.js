import React, { useEffect, useState } from "react";
import Icon from "../../../Resources/App Logo Alt.png";
import "./Etiket.css";
import QRCode from "qrcode.react";
import axios from "axios";

const Etiket = () => {
  const [bookingData, setBookingData] = useState([]);
  const [cardData, setCardData] = useState([]);
  const [isData, setIsData] = useState();
  const [apply, setApply] = useState(false);

  const [error, setError] = useState(null);

  
  const config = {
    headers: {
      'Content-Type': 'multipart/form-data;',
    },
  };

  const sc = localStorage.getItem('dataPenumpang');
  const akun = localStorage.getItem('akun');
  const jad = JSON.parse(localStorage.getItem('selectJadwal'));
      
  useEffect(() => {
    // setBookingData(JSON.parse(sc));
    const idAkun = JSON.parse(akun)
    const a = JSON.stringify(idAkun.id)
    const idH = JSON.parse(sc)
    const h = JSON.stringify(idH[0].TransaksiHeaderID)

    const selectTran = {
      id : h,
      AkunID : a
    }

    const ids = {
      id : h
    }
    

    axios.post('http://127.0.0.1:8000/api/getApply',  selectTran, config )
      .then(response => {
        const pply = parseInt(response.data.data[0].TerimaPembayaran, 10);
        setIsData(pply);
        
        if (pply === 1) {
          setApply(true);
        }
      })
      .catch(error => {
        console.error('Error', error);
      });

    axios.post('http://127.0.0.1:8000/api/getIdHeader',  ids, config )
            .then(response => {
              const sbd = response.data.data
              setCardData(sbd);
            })
            .catch(error => {
              console.error('Error', error);
            });
  }, [])

  if (error) {
    return <div>Error: {error.message}</div>;
  }
  return (
  <div className="container ">
    {apply ? (<div className="ticket">
    <div className="row navb">
      <div className="col-md-11 judul">
        <h3 className="">E-Tiket</h3>
      </div>
      <div className="col-md-1">
        <img src={Icon} width='50px' height='50px'></img>
      </div>
    </div>
    <div className="row mt-2 conten">
      <div className="col-md-6 ">
        <h2>Detail Penerbangan</h2>
        <p>Nama Maskapai: {jad.Maskapai}</p>
        <p>Nomor Penerbangan: {jad.KodePenerbangan}</p>
        <p>Tanggal Penerbangan: {jad.TanggalWaktuKeberangkatan}</p>
      </div>
      <div className="col-md-6">
        <h2>QR Code</h2>
        {cardData.map((booking, index) => (
        <div key={index}>
          <QRCode value={JSON.stringify(booking)} size={128} />
        </div>
      ))}
      </div>
    </div>
  </div>) : (<h2 className="mx-auto my-auto">Tiket sedang di peroses, Harap menunggu sebentar!!!</h2>)}
  </div>


  );
};

export default Etiket;
