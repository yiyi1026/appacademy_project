//responsible for connecting component tree with the store
// render giphys
import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  );
};

export default Root;
