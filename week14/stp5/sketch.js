let canvasContainer = document.querySelector('#canvas-container');

function setup() {
  createCanvas(400, 400).parent();
}

function draw() {
  background(220);
  circle(mouseX, mouseY, 40);
}
