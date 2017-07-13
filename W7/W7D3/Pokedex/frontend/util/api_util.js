export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  })
);

window.fetchAllPokemon = fetchAllPokemon;
