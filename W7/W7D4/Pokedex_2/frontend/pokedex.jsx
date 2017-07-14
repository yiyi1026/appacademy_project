import React from 'react';
import ReactDOM from 'react-dom';
import {fetchAllPokemon, fetchSinglePokemon} from './util/api_util';
import {receiveAllPokemon,
        requestAllPokemon,
        receiveSinglePokemon,
        requestSinglePokemon} from './actions/pokemon_actions';
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  //test
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store}/>, rootEl);
});
