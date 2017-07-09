import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock.jsx';
import Weather from './weather.jsx';
import Autocomplete from './autocomplete.jsx';
import Tabs from './tabs.jsx'

const Names = [
  'Hui',
  'Yu',
  'Derek',
  'Daidai',
  'Hulu',
  'Gulu'
];


class Root extends React.Component {
  render() {
    return(<div>
      <Clock/>
      <br/>
      <Weather placeholder="loading weather..."/>
      <Autocomplete names={Names} />
      <Tabs />
    </div>);


  }
}



document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root/>, main);
});
