String[] fruitName = {"Mango", "Strawberry", "Kiwi", "Plum", "Blueberry"};
int[] fruitAmt = new int[5];
color[] colors = {
  color(255, 180, 0),  // Mango
  color(255, 0, 0),    // Strawberry
  color(139, 69, 19),   // Kiwi
  color(186, 85, 211),  // Plum
  color(0, 0, 255)      // Blueberry
};
int totalInventory = 0;

void setup() {
  size(920, 720);  // 화면 크기 설정
  
  for (int idx = 0; idx < fruitAmt.length; idx++) {
    fruitAmt[idx] = int(random(5, 100));
    fruitAmt = new int[fruitName.length]; 
  }

  background(255);  // 흰색 배경
  textAlign(CENTER);
  textSize(20);
  noLoop();
}

void mousePressed() {
  // 과일 수량을 랜덤하게 변경
  for (int n = 0; n < fruitAmt.length; n++) {
    fruitAmt[n] = int(random(5, 100));
  }
  redraw();  // 그래프 다시 그리기
}

void draw() {
  background(240);  // 흰색 배경
  totalInventory = 0;  // 총 인벤토리 초기화

  // 총 과일 개수 계산
  for (int i = 0; i < fruitAmt.length; i++) {
    totalInventory += fruitAmt[i];
  }

  // 그래프의 전체 너비
  float barWidth = 40; // 막대 너비
  float spacing = 100;  // 막대 간 간격
  float startX = (width - (fruitName.length * (barWidth + spacing) - spacing)) / 2; // 시작 X 좌표 계산


  for (int i = 0; i < fruitName.length; i++) {
    float x = startX + i * (barWidth + spacing);  
    float barHeight = map(fruitAmt[i], 0, 150, 10, 200);  
   
    stroke(colors[i]);
    strokeWeight(4);
    noFill();
    rect(x, height / 2 - 100, barWidth, 200);  

    // 막대 그래프 색 채우기
    fill(colors[i]);
    noStroke();
    rect(x, height / 2 + 100 - barHeight, barWidth, barHeight);  
    textSize(25);

    // 과일 이름과 수량 표시
    fill(colors[i]);
    text(fruitName[i], x + barWidth * 0.5, height * 0.5 + 150);  // 과일 이름
    text("qty: " + fruitAmt[i], x + barWidth * 0.5 , height * 0.5 + 180);  // 수량
  }

  // 총 인벤토리 수량 표시
  fill(0);
  textSize(38);
  text("Total Fruit Inventory: " + totalInventory, width * 0.5, height -600);  // 중앙 정렬

  // 하단 텍스트
  textSize(20);
  text("FRUIT INVENTORY", width / 2, height - 20);  // 중앙 정렬
  text("EST. 2001", width - 100, height - 20);
}
