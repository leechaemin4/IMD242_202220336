let capture;

function setup() {
  createCanvas(400, 400);
  capture = createCapture(VIDEO);
  capture.size(100, 100);
  capture.hide();
}

function draw() {
  background(220);
  image(capture, 0, 0, 400, 400);
}
