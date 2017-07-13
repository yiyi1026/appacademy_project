import * as APIUtil from '../util/api_util';
//phase 1 Actions
export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';

export const fetchSearchGiphys = (searchTerm) => {
	return (dispatch) => {
		APIUtil.fetchSearchGiphys(searchTerm)
			.then(giphys => dispatch(receiveSearchGiphys(giphys.data)));
	}
};

export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  }
};
