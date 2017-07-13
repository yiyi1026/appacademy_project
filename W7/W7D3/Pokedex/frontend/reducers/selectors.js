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

export const selectAllPokemon = ({ pokemon }) => values(pokemon);

window.selectAllPokemon = selectAllPokemon;
