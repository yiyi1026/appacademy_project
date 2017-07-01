Function.prototype.inherits = function(superclass){
  function Surrogate(){}
  Surrogate.prototype = superclass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

// 
// instance = new Child();
// instance.method();
// instance.__proto__.proto__.method;
// surrogate === {__proto__: superclass.prototype, run: function () {}};
// Child.prototype.run = function () {};

function MovingObject () {
  this.move = true;
}
MovingObject.prototype.moveagain = function(){
  console.log('I\'m moving again.');
};

function Ship () {
  MovingObject.call(this);
}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

const ship = new Ship();
const obj = new MovingObject();
// console.log(obj.move.bind(ship));
ship.moveagain();
console.log(ship.move);

// Asteroid.move();
// Asteroid.dontmove();
// Ship.dontmove();
