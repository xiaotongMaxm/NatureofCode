import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;


Kinect2 kinect2;

ParticleSystem ps;

float minThresh = 480;
float maxThresh = 830;
PImage img;



void setup() {


  size(512, 424);
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();
  img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
  println(kinect2.depthWidth, kinect2.depthHeight);

  ps = new ParticleSystem(new PVector(width/2, 50));
}


void draw() {
  background(0);

  img.loadPixels();

  //minThresh = map(avgX, 0, width, 0, 4500);
  //maxThresh = map(avgY, 0, height, 0, 4500);

  int[] depth = kinect2.getRawDepth();
  float sumX = 0;
  float sumY = 0;
  float totalPixels = 0;

  for (int x = 0; x < kinect2.depthWidth; x++) {
    for (int y = 0; y < kinect2.depthHeight; y++) {
      int offset = x + y * kinect2.depthWidth;
      int d = depth[offset];

      if (d > minThresh && d < maxThresh) {
        img.pixels[offset] = color(0, 0, 255);

        sumX += x;
        sumY += y;
        totalPixels++;
      } else {
        img.pixels[offset] = color(0);
      }
    }
  }

  img.updatePixels();
  image(img, 0, 0);

  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;

  ps.origin.set(avgX, avgY, 0);
  ps.addParticle();
  ps.run();
}
