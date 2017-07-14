import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import { Route} from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';


class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    // console.log(this.props);
    return (
      <div>
        <section className="pokedex">
          <ul>
            {this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />)}
          </ul>
        </section>
          <Route path='/pokemon/:pokemonId' component={ PokemonDetailContainer }/>
      </div>
    );
  }
}

export default PokemonIndex;
