import pokemonReducer from './pokemon_reducer';
import {combineReducers} from 'redux';

const rootReducer = combineReducers({
  pokemon: pokemonReducer
});
export default rootReducer;
