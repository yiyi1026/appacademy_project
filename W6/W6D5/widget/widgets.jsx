import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './frontend/clock.jsx';
import Weather from './frontend/weather.jsx';
import Autocomplete from './frontend/autocomplete.jsx';

const Names = [
  'Hui',
  'Yu',
  'Derek',
  'Daidai'
];


class Root extends React.Component {
  render() {
    return(<div>
      <Clock/>
      <Weather/>
      <Autocomplete names={Names}/>

    </div>);


  }
}



document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root/>, main);
});
