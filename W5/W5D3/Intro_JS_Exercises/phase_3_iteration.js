Array.prototype.bubbleSort = function(){
  let unsorted = true;

  while (unsorted){
    unsorted = false;

    for (let i = 0; i < this.length - 1; i++){
      let j = i + 1;

      if (this[i] > this[j]) {
        let temp = this[i];
        this[i] = this[j];
        this[j] = temp;
        unsorted = true;
      }
    }
  }
  return this;
}
console.log([5, 3, 4, 2, 1].bubbleSort());

String.prototype.substrings = function() {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length + 1; j++) {
      substrings.push(this.slice(i, j));
    }
  }
  return substrings;
};
console.log('abc'.substrings());
