
ParticleSystem ps;

float dist_from_cam = 580; // default camera distance
float scroll;

int cube_size = 10;

// constants for making the gif
float z_shift = 30;
float rotation_angle = 0;


void setup() {
  size(720, 878, P3D);
  //fullScreen(P3D);

  ps = new ParticleSystem();
}

void draw() {
  background(0);

  ps.run();
  lines();

  camera_view();
  keyPressed();
}


void lines() {
  float shift = 30;
  pushMatrix();
  translate(-shift - 255 / 2, -shift - 255 / 2, -shift - 255 / 2);
  noStroke();
  fill(255);
  sphere(5);
  popMatrix();
  pushMatrix();
  translate(- 255 / 2, - 255 / 2, - 255 / 2);
  stroke(255, 0, 0);
  strokeWeight(5);
  line(-shift, -shift, -shift, 255 + shift, -shift, -shift);
  stroke(0, 255, 0);
  strokeWeight(5);
  line(-shift, -shift, -shift, -shift, 255 + shift, -shift);
  stroke(0, 0, 255);
  strokeWeight(5);
  line(-shift, -shift, -shift, -shift, -shift, 255 + shift);
  popMatrix();
}

// ____________________________________________________________________________________

void camera_view() { // can select from different camera settings
  // rotate around single point and use scroll to zoom
  dist_from_cam += scroll;

  // for interativity using mouse
  float rotation_angle = map(mouseX, 0, width, 0, TWO_PI);
  float elevation_angle = map(mouseY, 0, height, 0, PI);

  float centerX = dist_from_cam * cos(rotation_angle) * sin(elevation_angle);
  float centerY = dist_from_cam * sin(rotation_angle) * sin(elevation_angle);
  float centerZ = dist_from_cam * cos(elevation_angle);

  camera(centerX, centerY, centerZ, 0, 0, 0, 0, 0, -1);
}

void mouseWheel(MouseEvent event) {
  scroll = event.getCount();
  if (scroll == -1.0 || scroll == 1.0) { // to prevent continuous zooming
    scroll = 0;
  }
}

void keyPressed() {
  //final int k = keyCode;
  //if (k == ' ') {
  //  if (looping) {
  //    noLoop();
  //  } else {
  //    loop();
  //  }
  //}

  if (keyPressed) {
    // keys 'a' and 'q' decrease and increase the small diameter respectively
    if (key == 'q') {
      for (Particle p : ps.particles) {
        if (p.opacity < 255) {
          p.opacity += 2;
          println(p.opacity);
        }
      }
    }
    if (key == 'a') {
      for (Particle p : ps.particles) {
        if (p.opacity > 0) {
          p.opacity -= 2;
          println(p.opacity);
        }
      }
    }
    
    if (key == 'g') {
      greyscale = true;
    }
  } else {
    greyscale = false;
  }
}
