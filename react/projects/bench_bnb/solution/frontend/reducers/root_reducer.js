import { combineReducers } from 'redux';

import entities from './entities_reducer';
import ui from './ui_reducer';
import SessionReducer from './session_reducer';

const RootReducer = combineReducers({
  entities,
  ui,
  session: SessionReducer
});

export default RootReducer;
