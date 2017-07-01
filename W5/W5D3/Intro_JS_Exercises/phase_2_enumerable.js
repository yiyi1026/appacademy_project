Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
    let mapped = [];
    this.myEach(el => mapped.push(callback(el)));
      return mapped;
    }

Array.prototype.myReduce = function (callback, initialValue) {

  let arr = this;

  if (!initialValue) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let result = initialValue;

  arr.myEach(el => result = callback(result, el));

  return result;
};

console.log([1,2,3,4,5].myReduce( (total, item) => total + item ));
