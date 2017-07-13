import { combineReducers } from 'redux';

import GiphysReducer from './giphys_reducer';

const RootReducer = combineReducers({
  giphys: GiphysReducer
});

export default RootReducer;
