
class Particle {

  PVector position;
  color col;
  int opacity = 255;
  float diameter = (255 / (cube_size - 1)) / 2;
  
  Particle() {
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    noStroke();
    fill(red(col), green(col), blue(col), opacity);
    sphere(diameter);
    popMatrix();
  }
  
}
