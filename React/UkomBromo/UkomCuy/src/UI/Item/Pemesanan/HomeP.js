import React, { useEffect, useRef, useState } from "react";
import "../../../App.css";
import { Link, useNavigate } from "react-router-dom";
import Calendar from '../../../Resources/calendar.jpg';
import Clock from '../../../Resources/clock.jpg';
import Group from '../../../Resources/group.jpg';
import Card from "./Card";
import axios from "axios";

const HomeP = () => {

  const navigate = useNavigate();
  const [numberOfCards, setNumberOfCards] = useState(1);
  const [cardData, setCardData] = useState([]);
  const [codeStatus, setCodeStatus] = useState('');
  const spanRef = useRef();
  
  // take penumpang, dariID, keID form localstorage
  const penmpng = parseInt(localStorage.getItem('penumpang'));
  const [dariID,setDari] = useState(localStorage.getItem('dariID'));
  const [keID,setKe] = useState(localStorage.getItem('keID'));

  const [kupon, setKupon] = useState("");
  const [potonganDis, setPotonganDis] = useState("");

    // localstorage get 
    const jadwal = localStorage.getItem('selectJadwal');
    const jadwalData = JSON.parse(jadwal);
    
    // take item from local storage maskapaiid, harga, idjadwal
    const idJadwal = jadwalData.id;
    const idMaskapai = jadwalData.MaskapaiID
    const harga = jadwalData.HargaPerTiket;

    const hargaTot = harga * penmpng;

    // take item form local storage tanggal waktu
    
    const tggl = jadwalData.TanggalWaktuKeberangkatan;
    
    const parsedDate = new Date(tggl);
    const dateOptions = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const formattedDate = parsedDate.toLocaleDateString('id-ID', dateOptions);

    const jamAwal = parsedDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });

    const menitDitambahkan = parseInt(jadwalData.DurasiPenerbangan);
    const [jam, menit] = jamAwal.split(":").map(Number);
    const totalMenit = jam * 60 + menit + menitDitambahkan;

    const jamHasil = Math.floor(totalMenit / 60);
    const menitHasil = totalMenit % 60;

    const jamHasilFormatted = jamHasil < 10 ? `0${jamHasil}` : jamHasil;
    const menitHasilFormatted = menitHasil < 10 ? `0${menitHasil}` : menitHasil;

    const hasilAkhir = `${jamAwal} - ${jamHasilFormatted}:${menitHasilFormatted}`;


  // item To post in db
  const [akunID, setAkunID] = useState("")
  const [tanggalTransaksi, setTanggalTransaksi] = useState(tggl)
  const [penerbanganID, setPenerbanganID] = useState(idJadwal)
  const [plngn,setPlngn] = useState(penmpng);
  const [totHarga, setTotHarga] = useState(0);
  const [harTot, setHarTot] = useState(0);
  const [dataKupon, setDataKupon] = useState();
  const [statusID, setStatusID] = useState(1);
  const [waktuPerubahan, setWaktuPerubahan] = useState("");
  const [perkiraanWaktu, setPerkiraanWaktu] = useState("");
  const [terima, setTerima] = useState(0);

  // item show part in ui
  const [keberangkatan,setKeberangkatan] = useState('');
  const [tujuan,setTujuan] = useState('');
  const [maskapai,setMaskapai] = useState('');

  const config = {
    headers: {
      'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
    },
  };

  const formatRupiah = (nilai) => {
    return new Intl.NumberFormat('id-ID', {
      style: 'currency',
      currency: 'IDR'
    }).format(nilai);
  };


  const dariData = {
    ID: dariID,
  };
  const keData = {
    ID: keID,
  };
  const maskapaiData = {
    id: idMaskapai,
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

  const maskp = async () => {
    axios.post('http://127.0.0.1:8000/api/getIdMaskapai',  maskapaiData, config )
      .then(response => {
        setMaskapai(response.data.data[0]);
      })
      .catch(error => {
        console.error('Login gagal', error);
      });
  };



  useEffect(() => {
    setTotHarga(formatRupiah(hargaTot));
    setHarTot(hargaTot)

    const spanValue = spanRef.current.innerText;
    const numericValue = parseFloat(spanValue);

    if (!isNaN(numericValue)) {
      setNumberOfCards(numericValue); 
    }

    dari();
    ke();
    maskp();
  }, []);
  
  const handleCardChange = (index, data) => {
    const newData = [...cardData];
    newData[index] = data;
    setCardData(newData);

    const dataP = JSON.stringify(newData);
    localStorage.setItem('dataPenumpang', dataP);
  };

  const handleKupon = () => {
    const kup = {
      Kode : kupon
    }
    axios
      .post("http://127.0.0.1:8000/api/getKode", kup)
      .then((response) => {
        const nur = response.data.data[0];
        setDataKupon(response.data.data[0].id);

        
        if (nur != null) {
          const expirationDate = new Date(nur.BerlakuSampai);
          if (expirationDate <= new Date()) {
            setCodeStatus('Kode telah kedaluwarsa');  
            return; 
          }

          let potongan = hargaTot * nur.PresentaseDiskon / 100;
          setPotonganDis(potongan);
          if(potongan > nur.MaksimumDiskon)
          {
            potongan = nur.MaksimumDiskon;
            setPotonganDis(potongan);
          }
          let nen = hargaTot - potongan;
          setHarTot(nen)
          
          setTotHarga(formatRupiah(nen));
        }else{
          setCodeStatus('Kode tidak valid');
          setTotHarga(formatRupiah(hargaTot));
          setHarTot(hargaTot)
          setDataKupon(0);
        }
      })
      .catch((error) => {
        console.log(error);
        setCodeStatus('Kode tidak valid');
      });
  }

  const [show, setShow] = useState(false);

  const handleConfirm = () => {
    setShow(false); // Sembunyikan modal
    
    const all = {
      akunId : akunID,
      tgl : tanggalTransaksi,
      idJad : penerbanganID,
      maskpi : maskapai.Nama,
      pnmpng : plngn,
      totlHarga : totHarga,
      hargTot : harTot,
      hargaPaten : hargaTot,
      kuponId : dataKupon ?( dataKupon) : (0),
      potongan : potonganDis ? (potonganDis) : (0),
      statusId : statusID,
      waktuPerub : waktuPerubahan,
      perkiraan : perkiraanWaktu
    }
    const allData = JSON.stringify(all);
    localStorage.setItem("all", allData);

    
    navigate('/pembayaran')
  };

  return (
    <div className="content">
      <div className="content-header">
        <div className="container">
          <h4 className="m-0"> Pemesanan Anda</h4>
          <p>Isi data Anda dan review pesanan Anda.</p>

              <h4 className="mb-2">Detail Traveler</h4>

              <div className="row">
                <div className="col-lg-8">
                  {Array.from({ length: numberOfCards }, (_, index) => (
                    <Card 
                      key={index} 
                      title={index}
                      onCardChange={handleCardChange} 
                    />
                  ))}

                </div>

                <div className="col-sm-4">
              <div className="card">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">
                    <label className="text-secondary text-sm m-0">Penerbangan </label>
                    <p className="card-text m-0 mt-2">{keberangkatan.Nama}({keberangkatan.KodeIATA}) → {tujuan.Nama}({tujuan.KodeIATA})</p>
                    <p className="card-text">{maskapai.Nama}</p>
                  </li>
                  <li class="list-group-item">
                    <label className="text-secondary text-sm">Detail Penerbangan</label>
                      <ul className="p-0 mt-2">
                        <li className="d-flex justify-content-start">
                        <img src={Calendar} alt="" width='15px' height='20px'/>
                          <span className="ml-2">{formattedDate}</span>
                          </li>
                        <li className="d-flex">
                        <img src={Clock} alt="" width='15px' height='20px' className="jamta"/>
                          <span className="ml-2">{hasilAkhir}</span>
                        </li>
                        <li className="d-flex">
                        <img src={Group} alt="" width='15px' height='20px' className="mt-1"/>
                          <span className="ml-2" 
                          ref={spanRef}>{plngn}</span>
                          <span className="ml-1">Penumpang</span>
                        </li>
                      </ul>
                  </li>
                  <li className="list-group-item ">
                    <label className="text-secondary text-sm">Kode Promo </label>
                      <p className="text-danger">{codeStatus}</p>
                    <div className="d-flex mt-2">
                      <input type="text" name="kupon" className="input-group" placeholder="Masukkan Kupon"
                        value={kupon}
                        onChange={(e) => setKupon(e.target.value)}
                        required
                        />
                      <button onClick={handleKupon} className="btn btn-primary ml-4">Tambah</button>
                    </div>
                  </li>
                  <li className="list-group-item  m-0">
                    <div className="d-flex m-0">
                      <p className="col-7 text-bold input-group text-left p-0">Total Pembayaran </p>
                      <p className="col-5 text-info text-bold text-right p-0">{totHarga} </p>
                    </div>
                    
                    <div className="d-flex mt-2">
                    <button className="btn btn-primary" onClick={() => setShow(true)}>
                      Klik untuk Konfirmasi
                    </button>
                    {show && (
                      <div className="modal fade show" role="dialog" style={{ display: 'block' }}>
                        <div className="modal-dialog modal-dialog-centered" role="document">
                          <div className="modal-content">
                            <div className="modal-body mx-auto">
                              <h4>Apakah pesanan Anda benar?</h4>
                            </div>
                            <div className="modal-footer mx-auto">
                              <button
                                type="button"
                                className="btn btn-secondary"
                                onClick={() => setShow(false)}
                              >
                                Periksa Kembali
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
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="card-footer">
        
      </div>
    </div>
  );
};

export default HomeP;