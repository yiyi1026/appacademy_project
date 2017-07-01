function range(start, end) {
  if (start === end){
    return [];
  }

  let r = range(start, end -1);
  r.push(end-1);
  return r;

};
// console.log(range(3,10));

function sumRec(array){
  if (array.length === 0){
    return 0;
  }
  return array[0] + sumRec(array.slice(1));
};

// sumIter
function sumIter(numbers) {
  let sum = 0;

  numbers.forEach(function (number) {
    sum += number;
  });

  // or use reduce
  const reducedSum = numbers.reduce((acc, el) => acc + el);

  return sum;
  // return reducedSum;
}

function exponent(base, exp){
  if (exp === 0){
    return 1;
  }else if(exp > 0){
    return base * exponent(base, exp - 1);
  }else{
    return exponent(base, exp + 1) / base;
  }
};

function exponentTwo(base, n){
  if (n === 0){
    return 1;
  }else if (n === 1){
    return base;
  }else if (n % 2 === 0){
    return Math.pow(exponentTwo(base, n/2), 2);
  } else {
    return base * Math.pow(exponentTwo(base, (n - 1) / 2), 2)
  }
};

// 1 1 2 3 5 8 13 21
function fibonacci(n) {
  if (n < 3) {
    return [0, 1].slice(0, n);
  }
  
  let prev = fibonacci(n - 1);
  prev.push(prev[prev.length-1] + prev[prev.length-2]);
  return prev;
}
console.log(fibonacci(5));

function bsearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  } if (arr.length === 1){
    if (arr[0] == target) {
      return 0;
    } else {
      return -1;
    }
  }

  let mid = Math.floor(arr.length/2)
  if (arr[mid] === target){
    return mid;
  } else if (arr[mid] > target){
    return bsearch(arr.slice(0, mid), target);
  } else {
    let res = bsearch(arr.slice(mid+1), target);
    return (res === -1) ? res : res + mid + 1;
  }
}

function mergesort(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);

  return merge(mergesort(left), mergesort(right));
}

function merge(left, right) {
  let merged = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      merged.push(right.shift())
    } else {
      merged.push(left.shift())
    }
  }
  return merged.concat(left).concat(right);
}

function subsets(arr) {
  if (arr.length === 0){
    return [arr]
  }else{
    let sub = subsets(arr.slice(1));
    return sub.concat(slotvalue(sub,arr[0]));
  }
}

function slotvalue(arr, el){
  let result = [];
  for(let i = 0; i < arr.length; i++){
    result.push([el].concat(arr[i]));
  }
  return result;
}
