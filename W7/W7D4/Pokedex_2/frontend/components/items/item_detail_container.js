import { connect } from 'react-redux';
import ItemDetail from './item_detail';
import {selectPokemonItem} from '../../reducers/selectors';
//TBD
import {requestSinglePokemon} from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.match.params.itemId)
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

const ItemDetailContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(ItemDetail);

export default ItemDetailContainer;
