import { useNavigate, Outlet } from 'react-router-dom';

function AdminGuard() {
  const navigate = useNavigate();
    
  const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
  const isAdmin = localStorage.getItem('isAdmin') === 'true';

  if (!isLoggedIn || !isAdmin) {
    // Jika pengguna bukan admin atau belum login, arahkan ke halaman login atau tindakan lain
    navigate('/login'); // Gantilah dengan rute yang sesuai
    return null;
  }

  return <Outlet />;
}

export default AdminGuard;