import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
//phase 3
import {applyMiddleware} from 'redux';

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    RootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
  );

  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};


export default configureStore;
