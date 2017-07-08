import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state={
      inputVal: ''
    }
  }

  handleinput(str){

  }

  linkState(key){

    return (event =>handleinput(event));
  }

  render(){
    return (
      <div className='autocomplete'>
        <input onChange={this.linkState('inputVal')} value = {this.state.word}/>
        <ul>
          <li>whatever</li>
        </ul>
      </div>
    );
  }
}

export default Autocomplete;
