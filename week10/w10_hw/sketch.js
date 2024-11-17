let confetties = [];

let colours = ['#F25718', '#FF2E5B', '#FFD8B5', '#FCB604'];

function setup() {
  createCanvas(800, 800);
}

function draw() {
  background(255);

  if (mouseIsPressed) {
    cnt++;
  }

  for (let idx = confetties.length - 1; idx >= 0; idx--) {
    let aConfetti = confetties[idx];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(idx, 1);
    }
  }

  for (let idx = 0; idx < confetties.length; idx++) {
    confetties[idx].display();
  }
}

let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mouse = [0, 0];

function gen(x, y, n) {
  for (let idx = 0; idx < n; idx++) {
    let randomW = random(4, 20);
    let randomH = random(4, 20);
    let randomForce = random(1, 10);
    let randomAngForce = random(-30, 30);
    let randomColour = colours[int(random(colours.length))];
    let newConfetti = new Confetti(
      x,
      y,
      randomW,
      randomH,
      randomColour,
      randomForce,
      randomAngForce
    );
    confetties.push(newConfetti);
  }
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen: ' + cnt);
  gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key === 'p' || key === 'P') {
    console.log('confetties: ' + confetties.length);
  }
}

class Confetti {
  constructor(x, y, w, h, colour, force, angForce) {
    this.pos = [x, y];
    this.vel = [
      force * cos(radians(random(360))),
      force * sin(radians(random(360))),
    ];
    this.size = [w, h];
    this.colour = colour;
    this.ang = radians(random(360));
    this.angVel = radians(angForce);
  }

  update(force, friction) {
    this.vel[0] += force[0];
    this.vel[1] += force[1];
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.vel[0] *= friction;
    this.vel[1] *= friction;

    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos[0], this.pos[1]);
    rotate(this.ang);
    noStroke();
    fill(this.colour);
    rect(0, 0, this.size[0], this.size[1]);
    pop();
  }

  getDiagonal() {
    return sqrt(pow(this.size[0] * 0.5, 2) + pow(this.size[1] * 0.5, 2));
  }

  isOutOfScreen() {
    let diag = this.getDiagonal();
    return (
      this.pos[0] < -diag ||
      this.pos[0] > width + diag ||
      this.pos[1] < -diag ||
      this.pos[1] > height + diag
    );
  }
}
