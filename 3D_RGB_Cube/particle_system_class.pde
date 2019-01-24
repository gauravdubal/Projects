
boolean greyscale;

class ParticleSystem {

  ArrayList <Particle> particles = new ArrayList <Particle>();
  
  ParticleSystem() {
    
    int increment = int(255 / (cube_size - 1));
    
    for (int i = 0; i <= 255; i += increment) {
      for (int j = 0; j <= 255; j += increment) {
        for (int k = 0; k <= 255; k += increment) {

          Particle p = new Particle();

          //p.position = new PVector(i, j, k);
          p.position = new PVector(i - 255 / 2, j - 255 / 2, k - 255 / 2);
          p.col = color(i, j, k, p.opacity);

          particles.add(p);
        }
      }
    }
  }
  
  void run() {
    for (Particle p : particles) {
      if (greyscale == false) {
        p.display();
      } else { // to display only greyscale colours
        if (p.position.x == p.position.y & p.position.y == p.position.z) {
          p.display();
        }
      }
    }
  }
} 
