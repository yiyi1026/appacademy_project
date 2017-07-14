import React from 'react';
import { HashRouter, Router} from 'react-router-dom';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({pokemon}) =>  {
  return (<li>
            <Link to={`/pokemon/${pokemon.id}`}>
              {pokemon.id}:
              {pokemon.name}
              <img src={pokemon.image_url} />
            </Link>
          </li>);
};

export default PokemonIndexItem;
