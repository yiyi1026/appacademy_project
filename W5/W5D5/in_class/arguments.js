function sum(){
  const args = Array.from(arguments);
  console.log(arguments);
  console.log(args);
  return args.reduce((acc, value)=>{
    return (acc + value);}, 0);
}


function sumTwo(...args){
  return args.reduce((acc, value)=>{
    return (acc + value);}, 0);
}

console.log(sumTwo(1, 2, 3, 4, 5) );

Function.prototype.myBind = function(context,...bindArgs){
  return (...callArgs) => {
    return this.apply(context, bindArgs.concat(callArgs));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}
const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast, "meow")("Markov");

function curriedSum(numArgs){
  let numbers = [];
  function _curriedSum(number){
    numbers.push(number);
    if (numbers.length === numArgs){
      return sum(...numbers);
    }else{
      return _curriedSum;
    }
  }
  return _curriedSum;
}
const a = curriedSum(4);
console.log(a(5)(30)(20)(1));

Function.prototype.curry = function(numArgs){
  let argurry = [];
  let that = this;
  function _curriedSum(number){
    argurry.push(number);
    if (argurry.length === numArgs){
      return that(...argurry);
    }else{
      return _curriedSum;
    }
  }
  return _curriedSum;

};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}
console.log(sumThree.curry(3)(4)(20)(6));
