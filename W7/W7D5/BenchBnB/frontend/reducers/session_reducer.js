import merge from 'lodash/merge';
import {
  RECEIVE_ERRORS,
  RECEIVE_CURRENT_USER
} from '../actions/session_actions';

const nullUser = {
  currentUser: null,
  errors: []
};

const SessionReducer = (state = nullUser, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
      return merge({}, nullUser, {currentUser});
      //here currentUser means currentUser: currentUser
    // case LOGOUT:
    //   return nullUser;
    case RECEIVE_ERRORS:
      const errors = action.errors;
      return merge({}, nullUser, {errors});
    default:
      return state;
  }
};
export default SessionReducer;
