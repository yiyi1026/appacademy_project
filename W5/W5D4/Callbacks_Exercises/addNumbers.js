//readline.createInterface to create a global variable,
//Use process.stdin/process.stdout
const readline = require('readline');
const reader = readline.createInterface({
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){

  if(numsLeft === 0){
    completionCallback(sum);
    reader.close();
  }else{
    reader.question("What is your next number?", function(answer){
      const num = parseInt(answer);
      sum += num;
      console.log(sum);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  }
}
addNumbers(0, 4, sum => console.log(`Total Sum: ${sum}`));
