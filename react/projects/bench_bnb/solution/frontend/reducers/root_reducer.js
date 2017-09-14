import { combineReducers } from 'redux';

import entities from './entities_reducer';
import ui from './ui_reducer';
import SessionReducer from './session_reducer';
import errors from './errors_reducer';

const RootReducer = combineReducers({
  entities,
  session: SessionReducer,
  ui,
  errors,
});

export default RootReducer;
