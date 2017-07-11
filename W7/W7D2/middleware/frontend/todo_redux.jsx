import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
//phase 2
// import merge from 'lodash/merge';
//phase 1
const addLoggingToDispatch = (store)=>{
  let next = store.dispatch;

  return (action)=>{
    console.log(store.getState());
    console.log(action);
    next(action);
    console.log(store.getState());
  }
};

//phase 2
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//
//   middlewares.forEach((middleware)=>{
//     dispatch = middleware(store)(dispatch); //reassign dispatch
//   });
//   return merge({}, store, {dispatch});
// };



document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  //phase 1
  // store.dispatch = addLoggingToDispatch(store);
  //phase 2
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
