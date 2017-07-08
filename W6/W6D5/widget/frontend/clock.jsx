import React from 'react';

class Clock extends React.Component{
  constructor() {
    super();
    const time = new Date();

    this.state = {
      hour: time.toTimeString().slice(0, 8).concat(" PDT"),
      date: time.toDateString()
    };
    this.tick = this.tick.bind(this);

  }

  tick(){
    const time = new Date();
    const hour = time.toTimeString().slice(0, 8).concat(" PDT");
    const date = time.toDateString();
    this.setState({hour, date});

  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componenetWillUnmount() {
    let that = this;
    clearInterval(that.intervalId);  //that or this????
  }

  render(){

    return(
      <div className="clock">
        <ul className='clock'>
          <li className="date">Time:</li>
          <li className="date">Date:</li>
        </ul>
        <ul>
          <li className="date_value">{this.state.hour}</li>
          <li className="date_value">{this.state.date}</li>
        </ul>

      </div>
    );
  }
};

export default Clock;
