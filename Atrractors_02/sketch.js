let attractor;
let particles = [];

function setup() {
  createCanvas(640, 640);
  background(255);
  for (let i = 0; i < 100; i++) {
    particles.push(new Particle(300, 200));
  }
  attractor = createVector(300, 300);

}

function draw() {
  stroke(255);
  strokeWeight(1);
  point(attractor.x, attractor.y);

  for (let i = 0; i < particles.length; i++) {
    let particle = particles[i];
    particle.attracted(attractor); //any given particle can be attracted by attractor
    particle.update();
    particle.show();
  }
}
