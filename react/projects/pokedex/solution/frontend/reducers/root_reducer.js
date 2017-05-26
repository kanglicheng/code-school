import { combineReducers } from 'redux';

import PokemonReducer from './pokemon_reducer';
import ItemsReducer from './items_reducer';
import ErrorsReducer from './errors_reducer';

export default combineReducers({
  pokemon: PokemonReducer,
  items: ItemsReducer,
  errors: ErrorsReducer
});
