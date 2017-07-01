Array.prototype.uniq = function() {
  let uniqueArray = [];

  for (let i = 0; i < this.length; i++) {
    if (uniqueArray.indexOf(this[i]) === -1) {
      uniqueArray.push(this[i]);
    }
  }
  return uniqueArray;
}

Array.prototype.uniqTwo = function() {
  let uniqueArray = [];

  this.forEach(function(el) {
    if (!this.includes(el)) {
      uniqueArray.push(el);
    }
  })
  return uniqueArray;
}

Array.prototype.twoSum = function() {
  let pairs = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }

  return pairs;
}

Array.prototype.transpose = function() {

  transposed = []
  for (let i = 0; i < this[0].length; i++) {
    transposed.push([])
  }

  for (let row = 0; row < this.length; row++) {
    for (let col = 0; col < this[row].length; col++) {
      transposed[col][row] = this[row][col];
    }
  }

  return transposed;
}
console.log([
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
].transpose());
