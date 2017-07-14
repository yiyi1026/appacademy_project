import pokemonReducer from './pokemon_reducer';
import ItemsReducer from './items_reducer';
import {combineReducers} from 'redux';

const rootReducer = combineReducers({
  pokemon: pokemonReducer,
  items: ItemsReducer
});
export default rootReducer;
