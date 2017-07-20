import {createStore, applyMiddleware} from 'redux';
import RootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';
import thunk from 'redux-thunk';

const configurestore = (preloadedStore = {}) => (
  createStore(
    RootReducer,
    preloadedStore,
    applyMiddleware(thunk, logger)
  )
);

export default configurestore;
