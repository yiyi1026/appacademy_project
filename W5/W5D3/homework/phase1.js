// function madLib(str1, str2, str3) {
//   console.log(`We shall ${str1.toUpperCase()} the ${str2.toUpperCase()} ${str3.toUpperCase()}.`)
// }
//
// madLib('make', 'best', 'guac');

//is Substring
function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"))

//Phase II
//fizzBuzz
function fizzBuzz(array) {
  let fizzBuzz = [];
  array.forEach((el) => {
    if ((el % 3 === 0) && (el % 5 != 0)) {
      fizzBuzz.push(el)
    } else if ((el % 3 != 0) && (el % 5 === 0)) {
      fizzBuzz.push(el)
    }
  })
  return fizzBuzz;
}
// console.log(fizzBuzz([1, 3, 2, 6, 5, 8, 5, 2, 12, 24]));

//isPrime
let i = 2;

function isPrime(number) {
  if (number < 2) {
    return false;
  }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
  // if (i === number) return true
  // if (number < 2) {
  //   return false
  // } else if (number === 2) {
  //   return true
  // } else {
  //   if (number % i === 0) {
  //     return false
  //   } else {
  //     i++;
  //     return isPrime(number)
  //   }
  // }
}
// console.log(isPrime(3));
// console.log(isPrime(30));
// console.log(isPrime(23));

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 2;
  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
