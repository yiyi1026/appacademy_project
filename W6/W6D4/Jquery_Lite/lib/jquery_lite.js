/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);
window.$l= function(arg){
  if (Object.getPrototypeOf(arg)===String.prototype){
    let nodelist = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(nodelist));
  }else if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  }
};

$(()=>{

});


/***/ }),
/* 1 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);