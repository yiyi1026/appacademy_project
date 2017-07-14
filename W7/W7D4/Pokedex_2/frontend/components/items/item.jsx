import React from 'react';
import { Link } from 'react-router-dom';

const Item = ({item}) => {
  return (
    <li>
      <Link to={`/pokemon/${item.pokemon_id}/item/${item.id}`} >
        <img src={item.image_url} height='50' width='50'/>
      </Link>
    </li>
  );
};

export default Item;
