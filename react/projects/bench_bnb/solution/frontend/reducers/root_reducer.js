import { combineReducers } from 'redux';

import entities from './entities_reducer';
import FiltersReducer from './filters_reducer';
import SessionReducer from './session_reducer';

const RootReducer = combineReducers({
  entities,
  filters: FiltersReducer,
  session: SessionReducer
});

export default RootReducer;
