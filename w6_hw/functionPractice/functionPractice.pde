int randomSeed = int(random(10000));
int numHouses = 5; 
float groundY = 600; 

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);  
}

void mousePressed() {
  randomSeed = int(random(10000));  
}

void draw() {
  randomSeed(randomSeed);  
  background(0);
  stroke(0);
  line(0, groundY, width, groundY);

  for (int i = 0; i < numHouses; i++) {
    float houseWidth = random(80, 150);
    float houseHeight = random(100, 200);
    houses(random(50, width - houseWidth - 50), groundY - houseHeight, houseWidth, houseHeight);
  }
}

void houses(float x, float y, float w, float h) {

  float houseHue = random(0, 360);
  float doorHue = random(0, 360);
  float windowHue = random(0, 360);

  fill(houseHue, 20, 10);
  rect(x, y, w, h);

  fill(houseHue, 50, 60);
  rect(x, y, w , h*0.05);

  float doorWidth = w / 4;
  float doorHeight = h / 3;
  fill(doorHue, 70, 50);
  rect(x + w / 2 - doorWidth / 2, y + h - doorHeight, doorWidth, doorHeight);


  int numWindows = int(random(1, 4));  
  float windowSpacing = (w - numWindows * (w / 5)) / (numWindows + 1);

  for (int i = 0; i < numWindows; i++) {
    float winX = x + windowSpacing * (i + 1) + (w / 5) * i;
    float winY = y + random(10, h / 2 - 30);

    fill(windowHue, 100, 80);
    rect(winX, winY, w / 5, w / 5);
  }
}
