import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({store}) => (
  <Provider store = {store}>
    <GiphysSearchContainer />
  </Provider>
);

export default Root;


// <h1>container place</h1>
