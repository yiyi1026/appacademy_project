import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

//phase 1
const addLoggingToDispatch = (store)=>{
  const next = store.dispatch;

  return (action)=>{
    console.log(store.getState());
    console.log(action);
    next(action);
    console.log(store.getState());
  }
}

//phase 2
// const addLoggingToDispatch = store => next => action => {
//   const dispatch = store.dispatch;
//
//
//
//   if (typeof action === 'function'){
//
//     return next(action);
//   }
//   return
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  //phase 1
  store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
