float size = random(40, 110);
float strokeWeight = random(1, 5);
float h= random(255);
float s= random(255);
float b= random(255);

void setup() {
  size(1280, 720);
  background(0);
  colorMode(HSB);
  rectMode(CENTER);
  //fullScreen();
}

void mousePressed() {
  background(0);
}

void draw() {
  stroke(h, s, b);
  strokeWeight(strokeWeight);
  fill(h, s, b);
  if (mouseX < width /2) {
    square(mouseX, mouseY, size);
  } else  {
    circle(mouseX, mouseY, size);
  } 
  strokeWeight = random(1, 5);
  size = random(40, 110);
  h= random(100, 250);
  s= random(40, 80);
  b= random(196, 255);
}
