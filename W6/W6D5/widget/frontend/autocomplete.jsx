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
      <div className='autocomplete'>
        <ul>
          <input type="text" name="" value=""/>
          <li></li>
        </ul>
      </div>
    );
  }
}

export default Autocomplete;
