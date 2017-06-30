// window.setTimeout(function() {
//   alert('HAMMERTIME');
// }, 5000);

function hammerTime(time) {
  window.setTimeout(function() {
    console.log(`${time} is hammertime!`);
  }, time)
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {

  reader.question('Would you like some biscuits?', function(res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some tea?', (res_two) => {
      console.log(`You replied ${res_two}.`);

      const firstRes = (res === 'yes') ? 'do' : 'don\'t';
      const secondRes = (res_two === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}
teaAndBiscuits()
