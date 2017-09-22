const fs = require('fs');

// fs.readFile is an asynchronous function with two args: the path to the file and a callback to be invoked, remember the order of args.
// fs.readFile('./animals.txt', 'utf-8', (err, data) => {
//   if (err){
//     console.log(err);
//     return;
//   }
//   console.log(data);
// })

//fs.writeFile: If a file already exists as the first arg, it will be overwritten.

// fs.writeFile('./example.txt', 'I will be written t oexample.txt', err => {
//   if (err){
//     console.log(err);
//   }else{
//     console.log('file successfully written!');
//   }
// })

//parse input from HTTP requests
//1. pass information into script from command line.
//1.1 Node provides a global process object which will allow us to pass arbitrary args from our terminal. No need to require process.

// console.log(process);

//process.argv return  an array of two args: the absolute paths of Node executable and the file
console.log(process.argv);