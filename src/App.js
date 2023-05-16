import {Route} from "react-router-dom/cjs/react-router-dom.min";
import * as React from 'react'
import { Reset } from 'styled-reset'
import WriteMapPage from './newMap/WriteMapPage';


function App() {

  const setAddress = e => console.log(e);

  return (
    <>
      <Reset />
      <WriteMapPage setAddress={setAddress} />
      <Route path="/" />
    </>
  );
}
export default App;
