let body = document.getElementById("body");
let time = new Date();
let [hour, minute, second] = [time.getHours(), time.getMinutes(), time.getSeconds()];
let tail;
window.setInterval(refresh, 1000 );

const timetick = function(){
  second += 1
  if (second == 60){
    second = 0;
    minute += 1;
  }
  if (minute = 60){
    minute = 0;
    hour += 1;
  }
  if (hour == 24){
    hour = 0;
  }
  tail = hour > 11 ? 'AM' : 'PM'

};

const childtick = function(){

};

const refresh = function(){
  timetick();
  childtick();
};


let node = document.createElement("div");
node.innerHTML = JSON.stringify(time);
document.body.appendChild(node);