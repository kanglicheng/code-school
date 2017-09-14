import merge from 'lodash/merge';

import {
  RECEIVE_ERRORS,
  RECEIVE_CURRENT_USER,
} from '../actions/session_actions';

const defaultState = Object.freeze({
  session: [],
});

const ErrorsReducer = (state = defaultState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ERRORS:
      return merge({}, defaultState, {
        session: action.errors
      });
    case RECEIVE_CURRENT_USER:
      return defaultState;
    default:
      return state;
  }
};

export default ErrorsReducer;
