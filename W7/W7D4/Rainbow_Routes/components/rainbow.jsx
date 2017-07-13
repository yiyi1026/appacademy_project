import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        <NavLink exact activeClassName='active' to='/red' >Red only</NavLink>
        <NavLink activeClassName='active' to='/green' >Green only</NavLink>
        <NavLink exact activeClassName='active' to='/blue' >Blue only</NavLink>
        <NavLink activeClassName='active' to='/violet' >Violet only</NavLink>
        <div id="rainbow">
          <Route path='/red' component={Red} />
          <Route path='/green' component={Green} />
          <Route path='/blue' component={Blue}/ >
          <Route path='/violet' component={Violet} />

        </div>
      </div>
    );
  }
};

export default Rainbow;
