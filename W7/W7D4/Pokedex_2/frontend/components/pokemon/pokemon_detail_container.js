import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import {requestSinglePokemon} from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: state.pokemon.entities[state.pokemon.currentPoke],
  items: state.items
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
