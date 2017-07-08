import React from 'react';
class Weather extends React.Component{
  constructor() {
    super();

  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.pollWeather);
  }

//api.openweathermap.org/data/2.5/forecast?id=524901&APPID=2c66eb52f8e257c68e00ce93cebd55b


  render(){
    return (
      <div className="weather">☁☀</div>
    );
  }
}

export default Weather;
