import {combineReducers} from 'redux';
import todosReducer from './todos_reducer.js';

const rootReducer = combineReducers({
  todos: todosReducer
});


export default rootReducer;
