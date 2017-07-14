import { RECEIVE_ALL_POKEMON,
         RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const defaultState = () => ({
  entities: {},
  currentPoke: null
});

export default (state = defaultState(), action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, {entities: action.pokemon});
    case RECEIVE_SINGLE_POKEMON:
      // console.log(action.pokemon);
      return merge({}, state, {
        entities: {[action.pokemon.poke.id]: action.pokemon.poke},
        currentPoke: action.pokemon.poke.id
      });
    default:
      return state;
  }
};
