void setup() {
  size(640,480);
  background(50);
  //몸
  noStroke();
  fill(300,100,100);
  ellipse(320,240,200,250);
  fill(300,100,100);
  arc(297, 291, 220, 150, 0, PI+QUARTER_PI, PIE);
  //눈
  fill(0);
  circle(320,200,10);
  fill(0);
  circle(360,200,10);
  //입
  fill(255,250,0);
  triangle(330, 200, 348, 200, 360, 225);
  //그릇
  fill(250,230,10);
  ellipse(340,380,300,150);
  //지렁이
  noFill();
  stroke(200,100,100);
  strokeWeight(15);
  arc(340, 380, 30, 100, HALF_PI, PI);
  arc(315, 360, 90, 90, PI, PI+QUARTER_PI);
  arc(360, 380, 80, 80, PI+QUARTER_PI, TWO_PI);
}

void draw(){
}

void mousePressed()  {
  noStroke();
  //눈
  fill(300,100,100);
  circle(320,200,12);
  fill(300,100,100);
  circle(360,200,12);
  //눈
  fill(0);
  ellipse(320,200,10,5);
  fill(0);
  ellipse(360,200,10,5);
  //입
  fill(255,255,0);
  triangle(330, 200, 348, 200, 355, 235);
  //지렁이
  noFill();
  stroke(250,230,10);
  strokeWeight(17);
  arc(315, 360, 90, 90, PI, PI+QUARTER_PI);
}
