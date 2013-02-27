/**
 * Tapestry I Recode
 * 
 * Recreation of Tapestry I by Kenneth Knowlton for the Recode Project.
 * @see http://recodeproject.com/artwork/v1n2tapestry-i
 */

color black, white;
int pyramidSize;
PImage pyramidImage, buffer;

void setup() {
  size(600,600);
  noStroke();
  
  black = color(0);
  white = color(255);
  
  pyramidSize = 128;
  
  // Save a pyramid image.
  for (int i = 0; i < width/2; i++) {
    fill(255.0 * 2 * i/width);
    rect(i, i, width - i * 2, width - i * 2);
  }
  loadPixels();
  pyramidImage = createImage(width, height, RGB);
  pyramidImage.loadPixels();
  System.arraycopy(pixels, 0, pyramidImage.pixels, 0, pixels.length);
  pyramidImage.updatePixels();
  
  buffer = createImage(width, height, RGB);
  
  background(0);
  addPyramid(0, 0);
}

void draw() {
  image(buffer, 0, 0);
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = red(pixels[i]) % 64 < 32 ? #000000 : #ffffff;
  }
  updatePixels();
}

void mouseClicked() {
  addPyramid(mouseX, mouseY);
}

void addPyramid(int x, int y) {
  // Draw pixels from buffer.
  image(buffer, 0, 0);
  
  // Make our changes.
  blend(pyramidImage, 0, 0, width, height, x - pyramidSize/2, y - pyramidSize/2, pyramidSize, pyramidSize, ADD);
  
  // Copy pixels back into buffer.
  loadPixels();
  buffer.loadPixels();
  System.arraycopy(pixels, 0, buffer.pixels, 0, pixels.length);
  buffer.updatePixels();
}


