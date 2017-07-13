import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

//phase 1
  //API Util
import {fetchSearchGiphys} from './util/api_util';
  //Actions
import {receiveSearchGiphys} from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', () =>{
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));

})


//test-only code
window.fetchSearchGiphys = fetchSearchGiphys;
window.receiveSearchGiphys = receiveSearchGiphys;
