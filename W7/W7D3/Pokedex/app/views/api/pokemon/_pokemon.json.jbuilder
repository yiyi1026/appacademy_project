json.poke do
  json.extract! pokemon, :id, :name, :attack, :defense, :image_url, :moves, :poke_type
end

json.items do
  json.array! pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
