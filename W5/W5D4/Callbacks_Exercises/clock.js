class Clock {
  constructor(hours, minutes, seconds) {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    this.seconds++;
    if(this.seconds === 60){
      this.seconds -= 60;
      this.minutes++;
    }

    if(this.minutes === 60){
      this.minutes -= 60;
      this.hours++;
    }

    if(this.hours === 24){
      this.hours -= 24;
    }

    return this.printTime();

    // 1. Increment the time by one second.
    // 2. Call printTime.
  }

}

const clock3 = new Clock();
