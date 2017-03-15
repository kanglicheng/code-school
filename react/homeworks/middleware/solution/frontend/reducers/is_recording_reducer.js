import { START_RECORDING, STOP_RECORDING, ADD_NOTES, DELETE_TRACK } from '../actions/tracks_actions';

const isRecording = (state = false, action) => {
  switch(action.type) {
    case START_RECORDING:
      return true;
    case STOP_RECORDING:
      return false;
    default:
      return state;
  }
};

export default isRecording;
