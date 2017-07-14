export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  })
);

export const fetchSinglePokemon = (id) => (
  $.ajax({
    method: 'GET',
    url: `/api/pokemon/${id}`
  })
);

window.fetchAllPokemon = fetchAllPokemon;
window.fetchSinglePokemon = fetchSinglePokemon;
