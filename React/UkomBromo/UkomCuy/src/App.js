import { BrowserRouter, Route, Router, Routes } from "react-router-dom";
import Login from "./View/Login";
import Register from "./View/Register";
import Header from "./componenets/Header";
import HeaderU from "./UI/HeaderU";

function App() {
  return (
    <div className="wrapper">
      <BrowserRouter>
        <Login/>

        <Route path="/adminpage">
          <Header/>
        </Route>
        <Route path="/userpage">
          <HeaderU/>
        </Route>
        <Route path="/register">
          <Register/>
        </Route>
      </BrowserRouter>
    </div>
  );
}

export default App;
