import { merge } from 'lodash';

import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_SINGLE_POKEMON
} from '../actions/pokemon_actions';

const defaultState = () => ({
  entities: {},
  allFetched: false,
  fetched: new Set()
}) 

const addPokemon = (state, pokemon) => {
  const entities = Object.assign(
    {}, state.entities, 
    pokemon
  );
  const allFetched = true;
  return Object.assign({}, state, { entities, allFetched })
}

const addPoke = (state, poke) => {
  const entities = Object.assign(
    {}, state.entities, 
    { [poke.id]: poke }
  );
  const fetched = Object.assign(state.fetched.add(poke.id));
  return Object.assign({}, state, { entities, fetched })
}

const PokemonReducer = (state = defaultState(), action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return addPokemon(state, action.pokemon);
    case RECEIVE_SINGLE_POKEMON:
      return addPoke(state, action.payload.pokemon);
    default:
      return state;
  }
};

export default PokemonReducer;
