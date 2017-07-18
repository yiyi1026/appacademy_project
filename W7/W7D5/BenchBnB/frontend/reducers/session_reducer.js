// const _nullUser = {
//   currentUser: null,
//   errors: []
// };
//
// const SessionReducer = (state = _nullUser, action) => {
//   switch(action.type) {
//     case RECEIVE_CURRENT_USER:
//       const currentUser = action.currentUser;
//       return merge({}, _nullUser, {currentUser});
//     case LOGOUT:
//       return _nullUser;
//     case RECEIVE_ERRORS:
//       const errors = action.errors;
//       return merge({}, _nullUser, {errors});
//     default:
//       return state;
//   }
// };
