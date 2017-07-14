import React from 'react';

const ItemDetail = ({item}) => {
  return (
    <ul>
      <li>Name: {item.name}</li>
      <li>Happiness: {item.happiness}</li>
      <li>Price: {item.price}</li>
    </ul>
  );
};

export default ItemDetail;
// items: [
//   {
//     id: 15,
//     name: "Dark Vulcan",
//     pokemon_id: 2,
//     price: 12,
//     happiness: 58,
//     image_url: "/assets/pokeball.png"
//   }
