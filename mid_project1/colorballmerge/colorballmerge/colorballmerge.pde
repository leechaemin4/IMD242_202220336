ArrayList<Circle> circles; 
int maxSize = 100;     
float mergeDistance = 50;  

void setup() {
  fullScreen();   
  circles = new ArrayList<Circle>();
}

void draw() {
  background(255);
  if (mousePressed) {
    mergeCircles();
  }
  for (int idx = circles.size() - 1; idx >= 0; idx--) {
    Circle c = circles.get(idx);
    c.update();
    c.display();

    if (c.isOutOfScreen()) {
      circles.remove(idx);
    }
  }
  if (circles.size() > maxSize) {
    circles.remove(0);
  }
  fill(0);
  textSize(16);
  text("Circles: " + circles.size(), 10, 20);
}

void mousePressed() {
  addNewCircle(mouseX, mouseY);
}

void mouseDragged() {
  addNewCircle(mouseX, mouseY);
}


void addNewCircle(float x, float y) {
  float rad = random(10, 30);                  
  int col = color(random(220), random(100), random(50)); 
  Circle newCircle = new Circle(x, y, rad, col);
  circles.add(newCircle);
}


void mergeCircles() {
  for (int idx = 0; idx < circles.size(); idx++) {
    Circle c1 = circles.get(idx);

    for (int jay = idx + 1; jay < circles.size(); jay++) {
      Circle c2 = circles.get(jay);


      if (dist(c1.x, c1.y, c2.x, c2.y) < mergeDistance) {
        float newX = (c1.x + c2.x) / 2;
        float newY = (c1.y + c2.y) / 2;
        float newR = c1.rad + c2.rad * 0.5; 
        int newCol = lerpColor(c1.col, c2.col, 0.5); 

        c1.x = newX;
        c1.y = newY;
        c1.rad = newR;
        c1.col = newCol;
        circles.remove(jay);
        jay--; 
      }
    }
  }
}
