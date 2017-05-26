import { values } from 'lodash';

export const selectPokemonItem = ({ items }, itemId) => {
  const foundItem = items.find(item => item.id === itemId);
  return foundItem || {};
}

export const selectAllPokemon = ({ pokemon }) => values(pokemon.entities);
export const selectSinglePokemon = ({ pokemon }, id) => pokemon.entities[id];

export const allPokemonFetched = ({ pokemon }) => pokemon.allFetched;
export const singlePokemonFetched = ({ pokemon }, id) => pokemon.fetched.has(parseInt(id));
