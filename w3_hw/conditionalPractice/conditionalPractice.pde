void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);
  stroke(255);
  fill(150);
  strokeWeight(4);
  
    if (mouseY < height / 4 ) {
    line(width *.5-40, height * .1-20,
    width *.5+ 40, height * .15+ 20);
    } else if(mouseY < height / 4*2 ) {
       square(width*.5, height * .37, 60);
    } else if(mouseY < height / 4*3 ) {
      circle(width*.5, height * .63, 50);
    } else {
      rect(width*.5, height * .87,width*.20, height * .10, 2);
    }

  //line(width *.5-40, height * .1-20,
    //width *.5+ 40, height * .15+ 20);
  //square(width*.5, height * .37, 60);
  //circle(width*.5, height * .63, 50);
  //rect(width*.5, height * .87,width*.20, height * .10, 2);

  stroke(150);
  strokeWeight(4);
  line(0, height /4, width, height/4);
  line(0, height /4*2, width, height/4*2);
  line(0, height /4*3, width, height/4*3);
}
