import {selectAllPokemon} from '../../reducers/selectors';
import {
  requestAllPokemon,
  requestSinglePokemon
  } from '../../actions/pokemon_actions';
import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon()),
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
