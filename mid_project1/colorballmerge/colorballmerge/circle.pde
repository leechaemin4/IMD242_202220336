class Circle {
  float x, y;    
  float rad;      
  int col;       
  float vx, vy; 
  float[] pos;
  float[] vel;


  Circle(float x, float y, float rad, int col) {
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.col = col;
    this.vx = random(-2, 5);
    this.vy = random(-2, 5); 
  }

  void update() {
    x += vx;
    y += vy;

    if (x < rad || x > width - rad) {
      vx *= -1;
    }
    if (y < rad || y > height - rad) {
      vy *= -1;
    }
  }
    
      void boundary(float friction) {
    if (pos[0] < rad) {
      pos[0] = rad;
      vel[0] *= -friction;
    } else if (pos[0] > width - rad){
    pos[0] = width - rad ;
    vel[0] *= -friction;
    }
    if (pos[1] > height - rad) {
      pos[1] = height - rad;
      vel[1] *= -friction;    
    }
  }

  void display() {
    fill(col,50); 
    noStroke();
    ellipse(x, y, rad * 2, rad * 2);
  }

  boolean isOutOfScreen() {
    return x + rad < 0 || x - rad > width || y + rad < 0 || y - rad > height;
  }
}
