import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';

import Root from './components/root.jsx';
// import Content from './components/content_container.jsx';
import RootReducer from './reducers/root_reducer.js';

const store = configureStore;
document.addEventListener('DOMContentLoaded',()=>{
  // window.rootReducer = rootReducer;
  ReactDOM.render(<Root store = {store}/>, document.getElementById('root'));
});

// development things
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions';
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.removeTodo = removeTodo;
window.store = store;
