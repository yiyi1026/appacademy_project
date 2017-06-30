// PHASE I

// function titleize(names, callback){
//   let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
//   callback(titleized);
// }
//
// titleize(["Mary", "Brian", "Leo"],(names)=>{
//   names.forEach(name=>{console.log(name)});
// })

//PHASE II
class Elephant{
  constructor(name, height, tricks){
    this.name = name;
    this.height = height;
    this.tricks = tricks
  }
  trumpet(){
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!''`);
  }
  grow(){
    this.height += 12
  }
  addTrick(trick){
    this.tricks.push(trick)
  }
  play(){
    let trickIndex = Math.floor(Math.random() * (this.tricks.length));
    console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
  }

}
//Phase IV: Closures
function dinerBreakfast(){
  let baseOrder = 'cheesy scrambled eggs';
  function baseFood(food){
    if (food){
      baseOrder = baseOrder + ' and ' + food;
    }
    console.log(`I'd like ${baseOrder} please.`);
  }

  return baseFood;
}
let bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please"
bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."

//Test Cases
let hulu = new Elephant('hulu', 5.8, ["giving human friends a ride", "playing hide and seek"])
console.log(hulu.name);
console.log(hulu.tricks);
hulu.trumpet();
console.log(hulu.height);
hulu.grow();
console.log(hulu.height);
hulu.play();
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
Elephant.paradeHelper = function(elephant){
  console.log(`${elephant.name} is trotting by!`);
}

herd.forEach(Elephant.paradeHelper);
