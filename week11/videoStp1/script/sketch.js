let cp;
let canvasW, canvasH;
let scale;
let cpW, cpH;

function setup() {
  canvasW = 640;
  canvasH = 400;
  createCanvas(canvasW, canvasH);
  scale = 0.1;
  cpW = canvasW * scale;
  cpH = canvasH * scale;
  cp = createCapture(VIDEO);
  cp.size(cpW, cpH);
  cp.hide();
}

function draw() {
  background(0);
  // image(cp, 0, 0, width, height); //0,0 위치에 cp를 배치 , 캔버스 사이즈보다 캡쳐가 작은 상태에서 가로,세로를 추가했을 때 픽셀이 커지고 화질이 저하된다.
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      let bright = brightness(colour);
      let diameter = map(bright, 0, 255, 0, 20);
      circle(10 * x + 5, 10 * y + 5, diameter);
      fill(255);
      noStroke();
      // fill(colour[0], colour[1], colour[2]);
      // circle(10 * x + 5, 10 * y + 5, 10);
    }
  }
}
