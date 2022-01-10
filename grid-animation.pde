
boolean max = true;
boolean bg = false;

void setup() {
  size(1920, 1080);
  noFill();
}

void draw() {
  //
  //
  // punto riferimento per animazione testo
  //
  //
  float y=  map(cos(radians((frameCount ))), -1, 1, 0, height);
  float x = map(sin(radians((frameCount ))), -1, 1, 0, width);
  //
  //
  // condizione bg
  //
  //
  if (frameCount % 30 == 0) {
    bg = ! bg;
  }
  if (bg == false) {
    background(255);
    stroke(218, 112, 49);
    stroke(255);
  } else {
    background(255, 176, 255);
    stroke(255, 0, 0);
  }
  //
  //
  // impostazioni testo
  //
  //
  noFill();
  int line = 70;
  strokeWeight(line * 2);
  strokeCap(PROJECT);
  int r = int(map( x, 0, width, 200, 0));
  //
  //
  // Lettera G
  //
  //
  float rvY, diffY, diffX, tox, rWidth, dWidth, gDiff, rX;
  if ( y >line*2) {
    rvY =  y/2 + line*2;
    tox = line;
    gDiff = y-( y /3);
    rX =  x+line;
  } else {
    rvY =  y/2;
    tox = -line;
    gDiff = -line;
    rX =  x+line;
  }
  float gX =  x - line;
  float gY =  y - line;
  if ( y < (height - line*2)) {
    diffY = height -  y-line*2;
    diffX =  width -  x-line*2;
  } else {
    diffY = height -  y;
    diffX = width -  x;
  }

  if ( x < (width - (line*2))) {
    rWidth = width -  x-line*2;
  } else {
    rWidth = width -  x;
    diffX = width;
  }

  beginShape();
  vertex(gX, tox);
  vertex(tox, tox);
  vertex(tox, gY);
  vertex(gX, gY);
  vertex(gX, gDiff);
  vertex( x/2 +tox, gDiff);
  endShape();
  //
  //
  // lettera R
  //
  //
  rect(rX, line, rWidth, y/2, 0, r, r, 0);
  line(rX+line, rvY, width+line, y-line);
  line(rX, y/2+line, rX, y);
  //
  //
  // Lettera I
  //
  //
  float iX =  x/2;
  beginShape();
  vertex(iX, y);
  vertex(iX, height);
  endShape();
  //
  //
  // Lettera D
  //
  //
  rect( x+line, y+line, diffX, diffY, 0, r, r, 0);
  //
  //
  // Animazione ellissi
  //
  //
  fill(255, 230, 72);
  noStroke();
  float wave = map( cos(radians(frameCount)*3), -1, 1, 0, height);
  float wave2 = map( cos(radians(frameCount)*3), -1, 1, height, 0);
  if (wave== 1080.0) {
    max = !max;
  }
  float wPoint, wPoint2;
  wPoint = map( cos(radians(frameCount*3)), -1, 1, 0, height/2);
  wPoint2 = map( cos(radians(frameCount*3)), -1, 1, height/2, height);
  push();
  blendMode(DIFFERENCE);
  ellipse(width/2, wPoint, width, wave);
  ellipse(width/2, wPoint2, width, wave2);
  rectMode(CENTER);
  rotate(radians(-45));
  pop();
  //
  //
  fill(255);
  noStroke();
  strokeWeight(3);
  ellipse( x, y, 40, 40);
}
