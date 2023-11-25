import Nav from './Nav'
import Pembayaran from './Pembayaran'

const FullPembayaran = () => {
  return (
    <body className="hold-transition layout-top-nav">
      <div className="wrapper">
        <Nav/>
        <Pembayaran/>
      </div>
    </body>
  )
}

export default FullPembayaran
