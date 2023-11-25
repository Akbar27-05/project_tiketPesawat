import axios from 'axios';
import moment from 'moment-timezone';
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

const PaymentMethods = () => {
  const [isLoggedin, setIsLoggedin] = useState(false);
  const [cardData, setCardData] = useState([]);
  const navigate = useNavigate();


  const [idHeader, setIdHeader] = useState("")
  const [akunID, setAkunID] = useState("")
  const [penerbanganID, setPenerbanganID] = useState(0)
  const [plngn,setPlngn] = useState(0);
  const [harTot, setHarTot] = useState(0);
  const [kodePromoID, setKodePromoID] = useState(0);
  const [potonganDis, setPotonganDis] = useState(0);
  const [statusID, setStatusID] = useState(1);
  const [waktuPerubahan, setWaktuPerubahan] = useState("");
  const [perkiraanWaktu, setPerkiraanWaktu] = useState("");
  const [terima, setTerima] = useState(0);
  
  const [totHargaTampilan, setTotHargaTampilan] = useState(0); // tampilan
  const [hargaXPenumpang, setHargaXPenumpang] = useState(0); // tampilan

  const [maskapai, setMaskapai] = useState("");

  const formatRupiah = (nilai) => {
    return new Intl.NumberFormat('id-ID', {
      style: 'currency',
      currency: 'IDR'
    }).format(nilai);
  };

  useEffect(() => {
    const all = JSON.parse(localStorage.getItem('all'));

    setPenerbanganID(all.idJad);
    setPlngn(all.pnmpng);
    setHarTot(all.hargTot);
    setKodePromoID(all.kuponId);
    setPotonganDis(formatRupiah(all.potongan));

    setMaskapai(all.maskpi)
    setTotHargaTampilan(all.totlHarga);

    setHargaXPenumpang(formatRupiah(all.hargaPaten))
    console.log(all)

    const status = localStorage.getItem('isLoggedIn');
    if (status === 'true') {
      // data penumpang
      const sc = localStorage.getItem('dataPenumpang');
      setCardData(JSON.parse(sc));
      const status = localStorage.getItem('akun');
      const akunData = JSON.parse(status);
      setAkunID(akunData.id);
      setIsLoggedin(true);
    }
  }, []) 

  const [selectedPayment, setSelectedPayment] = useState(""); // State untuk menyimpan metode pembayaran yang dipilih
  const paymentMethods = [
    "Bank Debit",
    "Kartu Kredit",
    "E-wallet",
    "Transfer Bank",
  ];

  const handlePaymentChange = (method) => {
    setSelectedPayment(method);
  };

  const handleSubmit = (e) =>{
    e.preventDefault();

    if (isLoggedin) {
      const currentDateTime = moment().tz('Asia/Jakarta').format('YYYY-MM-DD HH:mm:ss');
      
      const header = new FormData();
      header.append("AkunID", akunID);
      header.append("TanggalTransaksi", currentDateTime);
      header.append("JadwalPenerbanganID", penerbanganID);
      header.append("JumlahPenumpang", plngn);
      header.append("TotalHarga", harTot);
      header.append("KodePromoID", kodePromoID);
      header.append("MetodePembayaran", selectedPayment);
      header.append("TerimaPembayaran", terima);

      axios
        .post("http://127.0.0.1:8000/api/insertData", header)
        .then((response) => {
          setIdHeader(parseInt(response.data.data, 10));
          localStorage.setItem('idHeder', response.data.data);
          
            
          axios
          .post("http://127.0.0.1:8000/api/insertDetail", cardData)
          .then((response) => {

            navigate('/etiket');
          })
          .catch((error) => {
            console.log(error);
          });
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      const isConfirmed = window.confirm('Anda harus login terlebih dahulu. Apakah anda akan login?');
      if (isConfirmed) {
        navigate('/login');
        localStorage.setItem('isPemesanan', 'true');
      }else{

      }
    }
  }

  return (
    <div className="container mt-5">
      <div className="card">
        <h5 className="card-title text-bold card-body pb-0">Pilih Metode Pembayaran : </h5>
        
        <div className="row">
          <div className="col-md-6">
            <div className="card-body">
              <div className="list-group">
                {paymentMethods.map((method, index) => (
                  <button
                    key={index}
                    className={`list-group-item list-group-item-action${
                      selectedPayment === method ? " active" : ""
                    }`}
                    onClick={() => handlePaymentChange(method)}
                  >
                    {method}
                  </button>
                ))}
              </div>
            </div>
          </div>
        
          <div className="col-md-6">
            <div className="card-body">
              <h3 className="card-deck mb-3">Detail Pembayaran</h3>
              <div className="row">
                <div className="col-4">
                  Pembayaran Melalui : 
                </div>
                <div className="col-6 text-right">
                  {selectedPayment}
                </div>
              </div>
              <h4 className="card-deck mt-4 mb-3">Rincian Harga</h4>
              <div className="row">
                <div className="col-4">
                  <p>{maskapai} x {plngn}</p>
                  <p>{potonganDis ? ("Potongan") : ("Potongan")}</p>
                </div>
                <div className="col-6 text-right">
                  <p>{hargaXPenumpang}</p>
                  <p style={{ textDecoration: 'line-through' }}>{potonganDis !== 0 ? (potonganDis) : (0)}</p>
                </div>
              </div>
              <hr />  
              <div className="row">
                <div className="col-4">
                  <h5 className="">Total Harga</h5>
                </div>
                <div className="col-6 text-right">
                  {totHargaTampilan}
                </div>
              </div>
            </div>
            <div className="card-body col-10">
              
              <button onClick={handleSubmit} className="btn btn-primary mt-3" >
                Lanjutkan Pembayaran
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default PaymentMethods;
