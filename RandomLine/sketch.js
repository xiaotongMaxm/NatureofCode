
let pos;
let prev;

function setup() {
  createCanvas(640 , 320);
  background(255);
  pos = createVector(300, 200);
  prev = pos.copy();
}

function draw() {
  stroke(0, random(20, 60));
  strokeWeight(2);
  line(pos.x, pos.y, prev.x, prev.y);

  let step = p5.Vector.random2D();
  step.mult(5);
  pos.add(step);
}
