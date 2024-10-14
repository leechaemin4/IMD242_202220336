int tileNum;
int randomSeed = 0;
float noiseMult = 0.1;

void setup() {
  size(800, 800);
}

void draw() {
  noiseSeed(randomSeed);
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16));
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));

  float tileSize = width / float(tileNum);

  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);

      fill(0);
      noStroke();
      rect(rectX, rectY, tileSize, tileSize);
      fill(0);
      stroke(255);
      strokeWeight(1);
      circle(centerX, centerY, tileSize * 1);


      pushMatrix();

      translate(centerX, centerY);
      rotate(radians(360 * noiseVal));
      fill(255);
      noStroke();
      circle(tileSize * 0.4, 0, tileSize*0.2);

      stroke(255);
      strokeWeight(1);
      line(0, 0, tileSize * 0.5, 0);

      popMatrix();
    }
  }
}
