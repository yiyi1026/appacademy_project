console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data){
    console.log("Here is your weather");
    console.log(data);
  },
  error(){
    console.log("You haven't signed in!");

  },
});

console.log("Outside AJAX!");
// Add another console log here, outside your AJAX request
