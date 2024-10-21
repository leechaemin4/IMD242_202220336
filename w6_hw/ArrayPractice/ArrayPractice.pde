String[] fruitName = {"Mango", "Strawberry", "Kiwi", "Plum", "Blueberry"};
int[] fruitAmt = new int[5];
color[] colors = {
  color(255, 180, 0),  
  color(255, 0, 0),    
  color(139, 69, 19),  
  color(186, 85, 211),  
  color(0, 0, 255)      
};
int totalInventory = 0;

void setup() {
  size(1280, 720); 
  
  for (int idx = 0; idx < fruitAmt.length; idx++) {
    fruitAmt[idx] = int(random(5, 100));
    fruitAmt = new int[fruitName.length]; 
  }
  background(255);  
  textAlign(CENTER);
  textSize(20);
}

void mousePressed() {
  for (int n = 0; n < fruitAmt.length; n++) {
    fruitAmt[n] = int(random(5, 100));
  }
}

void draw() {
  background(240);  
  totalInventory = 0;  


  for (int i = 0; i < fruitAmt.length; i++) {
    totalInventory += fruitAmt[i];
  }


  float barWidth = 40; 
  float spacing = 100; 
  float startX = (width - (fruitName.length * (barWidth + spacing) - spacing)) / 2; // 시작 X 좌표 계산


  for (int i = 0; i < fruitName.length; i++) {
    float x = startX + i * (barWidth + spacing);  
    float barHeight = map(fruitAmt[i], 0, 150, 10, 200);  
   
    stroke(colors[i]);
    strokeWeight(4);
    noFill();
    rect(x, height / 2 - 100, barWidth, 200);  


    fill(colors[i]);
    noStroke();
    rect(x, height / 2 + 100 - barHeight, barWidth, barHeight);  
    textSize(25);

  
    fill(colors[i]);
    text(fruitName[i], x + barWidth * 0.5, height * 0.5 + 150); 
    text("qty: " + fruitAmt[i], x + barWidth * 0.5 , height * 0.5 + 180);  
  }


  fill(0);
  textSize(38);
  text("Total Fruit Inventory: " + totalInventory, width * 0.5, height -600); 


  textSize(20);
  text("FRUIT INVENTORY", width / 2, height - 20);  
  text("EST. 2001", width - 100, height - 20);
}
