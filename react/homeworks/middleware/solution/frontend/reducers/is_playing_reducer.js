import { START_PLAYING, STOP_PLAYING } from '../actions/playing_actions';

const isPlaying = (state = false, action) => {
  switch(action.type) {
    case START_PLAYING:
      return true;
    case STOP_PLAYING:
      return false;
    default:
      return state;
  }
};

export default isPlaying;
