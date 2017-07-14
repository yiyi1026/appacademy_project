import React from 'react';
import ItemDetailContainer from '../items/item_detail_container.js';
import { Route } from 'react-router-dom';
import Item from '../items/item';

class PokemonDetail extends React.Component{

  componentDidMount(){
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps){
    // console.log('not equal');
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId){
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render(){
    // console.log(this.props);
    let currentPokemon = "";
    let currItems = "";
    const currPoke = this.props.pokemon;
    if (currPoke) {
      currItems = this.props.items.map(item => <Item key={item.name} item={item} />);
      currentPokemon = Object.keys(currPoke).map((el, index) => {
        return (
          <li key={index}>
            {el} : {currPoke[el]}
          </li>
        );
      });
    } else {
      return null;
    }

    return (
      <div>
        <img src={currPoke.image_url} />
          {currentPokemon}
        <section className="toys">
          <h3>Items</h3>
          <ul className="toy-list">
             {currItems}
          </ul>
          <Route path="/pokemon/:pokemonId/item/:itemId" component={ ItemDetailContainer } />
       </section>
      </div>
    );

  }


}

export default PokemonDetail;
