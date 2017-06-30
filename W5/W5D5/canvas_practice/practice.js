document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'rgb(199,237,204)';
  ctx.fillRect(100, 100, 600, 600);

  ctx.beginPath();
  ctx.arc(300, 300, 190, 0, 50 * Math.PI);
  ctx.strokeStyle = 'rgb(4, 58, 51)';
  ctx.lineWidth = 20;
  ctx.stroke();

  ctx.fillStyle = 'rgb(10, 150, 131)';
  ctx.fill();

});
