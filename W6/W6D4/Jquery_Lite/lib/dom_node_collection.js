class DOMNodeCollection{
  constructor(array){
    this.array = array;

  }

  html(str){
    if(str===undefined){
      return this.array[0].innerHTML;
    }else{
      this.array.forEach(el=>{
        el.innerHTML = str;
      });
    }
  }

  empty(){
    this.html('');
  }

  append(arg){
    let that = this;
    if(Object.getPrototypeOf(arg)===String.prototype){
      this.html(arg);
    }else if (arg instanceof HTMLElement){
      this.html(arg.outerHTML);
    }else if (arg instanceof DOMNodeCollection){
      arg.array.forEach(el=>{
        that.html(el.outerHTML);
      });
    }
  }

  attr(attribute, value){
    if (value === undefined) {
      return this.array[0].attribute.value;
    } else {
      this.array.forEach(el => {
        el.attribute.value = value;
      });
    }
  }

  addClass(class_name){
    this.array.forEach(el=>{
      el.className += " " + class_name;
    });
  }

  removeClass(class_name){
    this.array.forEach(el=>{
      let class_array = el.className.split(" ");
      for (let i = 0; i < class_array.length; i++) {
        if (class_array[i] === class_name) {
          class_array[i] = "";
        }
      }
      // let idx = class_array.indexOf(class_name);
      // if (idx >= 0){
      //   class_array = class_array.splice(index, idx);
      //   el.className = class_array;
    });
  }

  children() {
    let result = [];

    this.array.forEach(el => {
      for (let i = 0; i < el.children.length; i++) {
        result.push(el.children[i]);
      }
    });

    return new DOMNodeCollection(result);
  }

  parent() {
    let result = [];

    this.array.forEach(el => {
      result.push(el.parentElement);
    });

    return new DOMNodeCollection(result);
  }

  find(selector) {
    let matches = document.querySelectorAll(selector);
    let result = [];

    for (let i = 0; i < matches.length; i++) {
      for (let j = 0; j < this.array.length; j++) {
        if (this.array[j].children.includes(matches[i])) {
          result.push(matches[i]);
        }
      }
    }

    return new DOMNodeCollection(result);
  }

  remove() {
    this.array.forEach(el => {
      el.outerHTML = "";
    });

    this.array = [];
  }
}


module.exports = DOMNodeCollection;
