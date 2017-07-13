import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <div>
        <ul>
          {this.props.pokemon.map((poke, index) => {
            return (<li key={index}>
              {poke.name}:
              <img src={poke.image_url} />
            </li>);
          })}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
