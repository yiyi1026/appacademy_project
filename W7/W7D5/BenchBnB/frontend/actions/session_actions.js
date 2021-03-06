import * as APIUtil from '../util/session_api_util'
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
})

export const signup = (user) => (
  APIUtil.signup(user).then(user => (
    dispatch(receiveCurrentUser(user))
  ), error => (
    dispatch(receiveErrors(error.responseJSON))
  ))
);

export const login = user => (
  APIUtil.login(user).then(user => (
    dispatch(receiveCurrentUser(user))
  ),error => (
    dispatch(receiveErrors(error.responseJSON))
  ))
);

export const logout = () => (
  APIUtil.logout().then(user => (
    dispatch(receiveCurrentUser(null))
  ))
)
