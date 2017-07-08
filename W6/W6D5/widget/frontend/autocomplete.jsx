import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state={
      inputVal: ''
    }
  }

  render(){
    return (
      <ul>
      <input type="text" name="" value=""/>
        <li></li>
      </ul>
    );
  }
}

export default Autocomplete;
