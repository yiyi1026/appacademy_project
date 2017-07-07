const DOMNodeCollection = require('./dom_node_collection.js');
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
