import {combineReducers} from 'redux';
import todosReducer from './todos_reducer';

const RootReducer = combineReducers({
  todos: todosReducer
});


export default RootReducer;
