import React from 'react'
import HeaderU from './HeaderU'
import { Outlet } from 'react-router-dom'
import SideNavU from './SideNavU'
import FooterU from './FooterU'

const FullUsr = () => {
  return (
    <body className='hold-transition sidebar-mini layout-fixed'>
      <div className='wrapper'>
        <HeaderU/>
        <Outlet/>
        <SideNavU/>
        <FooterU/>
      </div>
    </body>
  )
}

export default FullUsr
