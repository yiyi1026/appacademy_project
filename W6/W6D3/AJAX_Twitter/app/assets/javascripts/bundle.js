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

const FollowToggle = __webpack_require__(1);

$(function() {
   $("button.follow-toggle").each( (index, element) => new FollowToggle(element) );
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);


class FollowToggle {
  constructor(el) { //el === button
    this.$el = $(el); // el is the actual button html code wrapped in jquery
    this.userId = this.$el.data("user-id"); //data attributes
    this.followState = this.$el.data("initial-follow-state");
    this.render(); //PIC OF BUTTON
    // this.handleClick(); //calling button click once button is created
    this.$el.on("click", this.handleClick.bind(this)); // attach click method so it doesn't trigger until clicked
  }

  render(){
    if(this.followState === "unfollowed"){
      this.$el.prop("disabled", false);
      this.$el.html("Follow!");
    }else if (this.followState === "followed"){
      this.$el.prop("disabled", false);
      this.$el.html("Unfollow!");
    } else if (this.followState === "following"){
      this.$el.prop("disabled", true);
      this.$el.html("Following...");
    } else {
      this.$el.prop("disabled", true);
      this.$el.html("Unfollowing...");
    }
  };


  handleClick(event){
    //will trigger callback with the event param

    const followtoggle = this;
    event.preventDefault();

    if (this.followState==="unfollowed") {
      this.followState="following"; //this changes the render property to disable follow button when clicked + loading
      this.render(); //this render disables OR enables click once loaded
      APIUtil.followUser(followtoggle.userId).then(() => {
        followtoggle.followState = "followed";
        followtoggle.render();
      });
    }else if (this.followState === "followed"){
      this.followState="unfollowing";
      this.render();
      APIUtil.unfollowUser(followtoggle.userId).then(() => {
        followtoggle.followState = "unfollowed";
        followtoggle.render();
        //what do we do if error occurs?
      });
    }
  }
}



module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser:id => APIUtil.changeFollowStatus(id, "POST"),

  unfollowUser: id => APIUtil.changeFollowStatus(id, "DELETE"),

  changeFollowStatus: (id, method) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: 'json',
      method
    })
  )
}


module.exports = APIUtil;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map