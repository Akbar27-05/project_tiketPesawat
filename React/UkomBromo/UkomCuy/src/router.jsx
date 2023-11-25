import { Navigate, createBrowserRouter } from "react-router-dom";
import Home from "./componenets/Item/Home";
import Login from "./View/Login";
import Register from "./View/Register";
import GuestLayout from "./components/GuestLayout";
import FullAdm from "./componenets/FullAdm";
import MasterBandara from "./componenets/Item/MasterBandara";
import MasterMaskapai from "./componenets/Item/MasterMaskapai";
import KodePromo from "./componenets/Item/KodePromo";
import JadwalPenerbangan from "./componenets/Item/JadwalPenerbangan";
import UbahStatus from "./componenets/Item/UbahStatus";
import NotFound from "./View/NotFound";
import HomeU from "./UI/Item/HomeU";
import Pesanan from "./UI/Item/Pesanan";
import TiketSaya from "./UI/Item/TiketSaya";
import FullUsr from "./UI/FullUsr";
import FullPemesanan from "./UI/Item/Pemesanan/FullPemesanan";
import CariBandara from "./UI/Item/CariBandara";
import FormMasterBandara from "./componenets/Form/FormMasterBandara";
import FormMasterMaskapai from "./componenets/Form/FormMasterMaskapai";
import FullPembayaran from "./UI/Item/Pembayaran/FullPembayaran";
import Etiket from "./UI/Item/Etiket/Etiket";
import FormKodePromo from "./componenets/Form/FormKodePromo";
import FormJadwalPenerbangan from "./componenets/Form/FormJadwalPenerbangan";
import AcceptPembayaran from "./componenets/Item/AcceptPembayaran";

const router = createBrowserRouter([
  {
    path: '',
    element: <Navigate to="/userpage"/>
  },
  {
    path: '/pemesanan',
    element: <FullPemesanan/>
  },
  {
    path: '/pembayaran',
    element: <FullPembayaran/>
  },
  {
    path: '/etiket',
    element: <Etiket/>
  },
  {
    path: '/adminpage',
    element: <FullAdm/>,
    children: [
      
      {
        path: '',
        element: <Home/>
      },
      {
        path: 'masterbandara',
        element: <MasterBandara/>
      },
      {
        path: 'mastermaskapai',
        element: <MasterMaskapai/>
      },
      {
        path: 'kodepromo',
        element: <KodePromo/>
      },
      {
        path: 'jadwalpenerbangan',
        element: <JadwalPenerbangan/>
      },
      {
        path: 'ubahstatus',
        element: <UbahStatus/>
      },
      {
        path: 'accept',
        element: <AcceptPembayaran/>
      },
    ]
  },
  {
    path: '/userpage',
    element: <FullUsr/>,
    children: [
      
      {
        path: '',
        element: <HomeU/>
      },
      {
        path: 'pesanan',
        element: <Pesanan/>
      },
      {
        path: 'tiketsaya',
        element: <TiketSaya/>
      },
      {
        path: 'caribandara',
        element: <CariBandara/>,
        
      }
    ]
  },
  {
    path: '/',
    element: <GuestLayout/>,
    children: [
      {
        path: 'login',
        element: <Login/>
      },
      {
        path: 'register',
        element: <Register/>
      }, 
    ]
  },
  {
    path: '/form',
    children: [
      {
        path: 'formbandara',
        element: <FormMasterBandara/>
      },
      {
        path: 'formmaskapai',
        element: <FormMasterMaskapai/>
      },
      {
        path: 'formpromo',
        element: <FormKodePromo/>
      },
      {
        path: 'formjadwal',
        element: <FormJadwalPenerbangan/>
      },
    ]
  },
  {
    path: '*',
    element: <NotFound/>
  }
])

export default router