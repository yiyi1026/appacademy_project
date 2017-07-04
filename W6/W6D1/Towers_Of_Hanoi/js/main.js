const HanoiGame = require("../js/game.js");
const HanoiView = require("../js/hanoi-view.js");
$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});
