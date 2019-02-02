// let x;
// let y;
let pos;
let prev;

function setup() {
  createCanvas(400, 400);
  background(230);
  x = 200;
  y = 200;
  pos = createVector(200, 200);
  prev = pos.copy();
}

function draw() {
  stroke(0, random(20, 60));
  strokeWeight(2);
  line(pos.x, pos.y, prev.x, prev.y);

  noStroke();
  fill(0, random(40));
  ellipse(pos.x, pos.y, random(5, 20));
  ellipse(prev.x, prev.y, random(5, 20));
  prev.set(pos);

  let step = p5.Vector.random2D();
  step.mult(5);
  pos.add(step);
}
