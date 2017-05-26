json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
  json.image_url asset_path(@pokemon.image_url)
end

json.items do
  json.array! @pokemon.items, partial: 'api/items/item', as: :item
end
