void setup() {
  size(800, 800); 
  background(0);
}

void draw() {
  pushMatrix();
  translate(0, 0);
  noStroke();
  fill(255);
  circle(width * 0.5 , height*0.5,width-80);
  popMatrix();
  pushMatrix();
  strokeWeight(2); 
  translate(width * 0.5 , height * 0.5);
  

  // 60개 마커 그리기
  for (int maker = 0; maker < 60; maker++) {
    float angle = TWO_PI / 60 * maker; // 각 마커의 각도 (라디안 단위)
    float x1 = cos(angle) * 360;
    float y1 = sin(angle) * 360;
    float x2 = (maker % 5 == 0) ? cos(angle) * 330 : cos(angle) * 340;
    float y2 = (maker % 5 == 0) ? sin(angle) * 330 : sin(angle) * 340;

    stroke(maker % 5 == 0 ? 0 : 150); 
    strokeWeight(maker % 5 == 0 ? 4 : 2);
    line(x1, y1, x2, y2);
  }


  int hr = hour();
  int min = minute();
  int sec = second();


  float secAngle = map(sec, 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(255, 0, 0); 
  strokeWeight(2);
  line(0, 0, cos(secAngle) * 300, sin(secAngle) * 300);


  float minAngle = map(min, 0, 60, 0, TWO_PI) - HALF_PI;
  stroke(0); 
  strokeWeight(4);
  line(0, 0, cos(minAngle) * 250, sin(minAngle) * 250);


  float hrAngle = map(hr + min / 60.0, 0, 12, 0, TWO_PI) - HALF_PI;
  stroke(0); // 검정색
  strokeWeight(6);
  line(0, 0, cos(hrAngle) * 180, sin(hrAngle) * 180);
  
   popMatrix();
}
