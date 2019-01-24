
void setup() {
  size(850, 850, P3D);
  //fullScreen(P3D);
  
  background(0);
}

float rotation = 0;

void draw() {

  if (rotation < 50) {
    
    pushMatrix();
    translate(width / 2, height / 2);
    
    // experiment with different rates to get different outputs 
    rotateX(rotation);
    rotateY(rotation / 7);
    rotateZ(rotation);
    
    fill(255, 0, 0, 1);
    stroke(255, 5);
    rect(0, 0, 200, 200);
    popMatrix();

    rotation += 0.02;
    
  } else {
    
    println("finished");
    saveFrame("tile.png");
    
  }
}
