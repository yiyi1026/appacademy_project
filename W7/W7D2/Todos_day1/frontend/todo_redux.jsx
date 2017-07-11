import React from 'react';
import ReactDOM from 'react-dom';

import Content from './components/content_container.jsx';
import configureStore from './store/store.js';
import rootReducer from './reducers/root_reducer.js';
import Root from './components/root.jsx';

const store = configureStore;
document.addEventListener('DOMContentLoaded',()=>{
  window.rootReducer = rootReducer;
  ReactDOM.render(<Root store = {store}/>, document.getElementById('root'));
});

// development things
import { receiveTodo, receiveTodos } from './actions/todo_actions';
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.store = store;
