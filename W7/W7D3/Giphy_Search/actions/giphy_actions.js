import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

//action creator, accept giphys key-value pair and return an action.
export const receiveSearchGiphys = giphys => (
  {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  }
);

export const fetchSearchGiphys = searchTerm => dispatch => {
  APIUtil.fetchSearchGiphys(searchTerm).then((giphys) => (dispatch(receiveSearchGiphys(giphys.data))))
}


//test only
window.receiveSearchGiphys = receiveSearchGiphys;
window.fetchSearchGiphys = fetchSearchGiphys;
