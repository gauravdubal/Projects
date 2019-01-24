
void setup() {
  size(850, 850, P3D);
  //fullScreen(P3D);
}

float dist_from_cam = 2000;
float scroll;
float rotation = 0;

void draw() {

  background(0);

  int square_side = 100;
  int rows = 50;
  int cols = 50;

  for (float j = 0; j < height - square_side / 2; j += height / rows) {
    int r = int(map(j, 0, height, 0, 255));
    for (float i = 0; i < width  - square_side / 2; i += width / cols) {
      int b = int(map(i, 0, width, 255, 0));
      pushMatrix();
      translate(i + square_side / 2, j + square_side / 2);
      translate((width / cols - square_side) / 2, (height / rows - square_side) / 2);
      //translate(square_side / 2, square_side / 2);
      rotateX(rotation / 4);
      rotateY(rotation);
      rotateZ(2 * rotation);
      fill(r, 0, b, 100);
      stroke(255, 150);
      rectMode(CENTER); // interesting effect observed by commenting this out! 
      float w = 4 * square_side * sin(map(i, 0, width - square_side / 2, 0, PI));
      float h = 4 * square_side * sin(map(j, 0, height - square_side / 2, 0, PI));
      rect(0, 0, w, h);
      popMatrix();
    }
  }

  rotation += 0.02;

  camera_view();

  //saveFrame("output/frame_####.png");
}

void camera_view() { // can select from different camera settings
  // rotate around single point and use scroll to zoom
  dist_from_cam += scroll;

  // for interativity using mouse
  float rotation_angle = map(mouseX, 0, width, 0, TWO_PI);
  float elevation_angle = map(mouseY, 0, height, 0, PI);
  // for screenshotting
  //float rotation_angle = PI / 4;
  //float elevation_angle = PI / 4;

  float centerX = dist_from_cam * cos(rotation_angle) * sin(elevation_angle);
  float centerY = dist_from_cam * sin(rotation_angle) * sin(elevation_angle);
  float centerZ = dist_from_cam * cos(elevation_angle);

  camera(centerX, centerY, centerZ, width / 2, height / 2, 0, 0, 0, -1);
}

void mouseWheel(MouseEvent event) {
  scroll = event.getCount();
  if (scroll == -1.0 || scroll == 1.0) { // to prevent continuous zooming
    scroll = 0;
  }
}
