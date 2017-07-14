import { values } from 'lodash';

// export const selectAllPokemon = (state) => {
//   const allPokemons = [];
//
//   Object.keys(state.pokemon).forEach((id) => {
//     allPokemons.push(state.pokemon[id]);
//   });
//
//   return allPokemons;
// };

export const selectAllPokemon = ({ pokemon }) => values(pokemon.entities);

export const selectPokemonItem = ({ items }, itemId) => {
  const foundItem = items.find(item => item.id == itemId);
  return foundItem || {};
};

// window.selectPokemonItem = selectPokemonItem;
window.selectAllPokemon = selectAllPokemon;
