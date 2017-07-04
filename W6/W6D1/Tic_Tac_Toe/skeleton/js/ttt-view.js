class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $li = $('li');
    const that = this;
    $li.each((index, el)=>{
      const $el = $(el);
      $el.on('click',()=>{
        const $currentTarget = $(event.currentTarget);

        that.makeMove($currentTarget);
        const winner = that.game.board.winner();
        console.log(winner);
        if (winner){
          setTimeout(function() { alert(`You Win, ${winner}!`); }, 300);
        }
      });
    });
  }

  makeMove($square) {
    $square.addClass('white');
    if ($square.text()){
      alert("Invalid Move!");
      return;
    }
    $square.text(this.game.currentPlayer);
    const id = $square.attr('id');
    const pos = [parseInt(id[0]),parseInt(id[1])];
    this.game.playMove(pos);
  }

  setupBoard() {
    // const grid = this.game.board;
    const $ul = $("<ul></ul>");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $li = $("<li></li>");
        $li.attr('id',`${i}${j}`);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }

}


module.exports = View;
