/*
 Name: Giacomo Cavarretta
 Student Number: 20104117
 */

//GLOBAL VARS

//Flag
boolean isCanvasGeneratorLocked = true;  //Manipulated by mousePressed and mouseRelease event, used to generate a new painting

//Default painting settings
int resolution = 1; //Manipulated by mouseWheel event, can get values from 2^0 to 2^4, resizing the cells
int spacedOut = 4; //Manipulated by keyReleased event (+ and - keys), can get values from 1 to 10, to reduce or increase the number of objects in the painting
int palette = 0; //Manipulated by keyReleased event (0, 1, 2 and 3) to choose between 3 different palettes

//Sign settings
String name = "GIacoMO";
String surname = "CavaRRetta";
String studentNumber = "20104117";

//EVENT LISTENERS
void mouseWheel(MouseEvent event) {
  float e = event.getCount(); //Used to distinguish scroll direction. Store -1.00 if scroll up, 1.0 if scroll down
  if (palette!=0) {
    if (e==1&&resolution<16) {
      resolution*=2;
      //println(palette); //Debug purpose
      drawCanvas(palette);
    }
    if (e==-1&&resolution>1) {
      resolution/=2;
      drawCanvas(palette);
    }
  }
}

void mouseClicked() { //To save the painting by right click
  if (mouseButton==RIGHT) save("AutumnLeaves.PNG");
}

void mousePressed() {
  if (mouseButton==LEFT) isCanvasGeneratorLocked=false;
}

void mouseReleased() {
  if (mouseButton==LEFT) isCanvasGeneratorLocked=true;
}

void keyReleased() {
  int prevValspacedOut=spacedOut; //Used to detect a change of the value
  int prevValPalette=palette; //Used to detect a change of the value
  if (palette!=0) {
    if (spacedOut>1) if (key=='-') spacedOut--;
    if (spacedOut<10) if (key=='+') spacedOut++;
    if (prevValspacedOut!=spacedOut) drawCanvas(palette);
  }
  if (key=='0') palette=0;
  if (key=='1') palette=1;
  if (key=='2') palette=2;
  if (key=='3') palette=3;
  if (prevValPalette!=palette&&palette!=0) drawCanvas(palette);
  else if (prevValPalette!=palette&&palette==0) drawCanvas();
}

//BESPOKE METHODS
int randomValue(int start, int end) { //Allows us to get random integers between two numbers inclusive given as parameters
  return int(random(start, end+1));
}

int randomOffset(int negativeRange, int positiveRange) {
  return -randomValue(0, negativeRange) + randomValue(0, positiveRange);
};

void drawCanvas() { //To paint each cell of the canvas randomly with a grid of 16x9 (80 size each cell by 1, default resolution)
  resolution=2;
  spacedOut=6;
  int cell=80/resolution;
  int col=16*resolution;
  int row=9*resolution;
  int startOffsetRect=40;
  int endOffsetRect=40;

  background(#4C392E);
  for (int i=0; i<col; i++) {
    for (int j=0; j<row; j++) {
      int randomShape=randomValue(0, spacedOut*resolution);
      fill(randomColor(3));
      if (randomShape==0) rect(i*cell+randomOffset(startOffsetRect, endOffsetRect), j*cell, cell, cell, randomValue(0, 50), randomValue(0, 50), randomValue(0, 50), randomValue(0, 50));
      else if (randomShape==1) triangle (i*cell+randomOffset(20, 20), j*cell+cell+randomOffset(20, 20), i*cell+40 +randomOffset(40, 40), j*cell+randomOffset(20, 20), i*cell+80+randomOffset(20, 20), j*cell+80+randomOffset(20, 20));
    }
  }
}

void drawCanvas(int paletteChosen) { //This version allows us to choose a palette of colours for the painting
  int cell=80/resolution;
  int col=16*resolution;
  int row=9*resolution;
  int startOffsetRect=40;
  int endOffsetRect=40;

  background(#4C392E);
  int i=0;
  while (i<col) {
    int j=0;
    while (j<row) {
      int randomShape=randomValue(0, spacedOut*resolution);
      fill(randomColor(paletteChosen));
      if (randomShape==0) rect(i*cell+randomOffset(startOffsetRect, endOffsetRect), j*cell, cell, cell, randomValue(0, 50), randomValue(0, 50), randomValue(0, 50), randomValue(0, 50));
      else if (randomShape==1) triangle (i*cell+randomOffset(20, 20), j*cell+cell+randomOffset(20, 20), i*cell+40 +randomOffset(40, 40), j*cell+randomOffset(20, 20), i*cell+80+randomOffset(20, 20), j*cell+80+randomOffset(20, 20));
      j++;
    }
    i++;
  }
}

void drawSign(String name, String surname, String studentNumber) { //To sign the painting with my details
  String formattedName = name.substring(0, 1).toUpperCase()+name.substring(1, name.length()).toLowerCase(); //I was allowed to chain these methods because they all return a string as a value
  String formattedSurname = surname.substring(0, 1).toUpperCase()+surname.substring(1, surname.length()).toLowerCase();

  /* In these loops I wrote twice the same text, once in grey and once in white but with a smaller size.
   With this trick I got the effect of a text with a border getting higher contrast and better readability of the text above the image */
  for (int i=0; i<name.length(); i++) {
    fill(#4C392E);
    textSize(46);
    text(formattedName.charAt(i), i*80+10, 60);
  }
  for (int i=0; i<name.length(); i++) {
    fill(255);
    textSize(45);
    text(formattedName.charAt(i), i*80+10+2, 60-2);
  }
  int j=0;
  do {
    fill(#4C392E);
    textSize(46);
    text(formattedSurname.charAt(j), j*80+10, 140);
    fill(255);
    textSize(45);
    text(formattedSurname.charAt(j), j*80+10+2, 140-2);
    j++;
  } while (j<surname.length()) ;
  int k=0;
  while (k<studentNumber.length()) {
    fill(#4C392E);
    textSize(46);
    text(studentNumber.charAt(k), k*80+10, 700);
    k++;
  }
  int l=0;
  while (l<studentNumber.length()) {
    fill(255);
    textSize(45);
    text(studentNumber.charAt(l), l*80+10+2, 700-2);
    l++;
  }
}

color randomColor(int paletteNumber) { //Returns a random color from the palette given in the argument
  color paint1 =#DC602E;
  color paint2 =#BC412B;
  color paint3 =#606C38;
  color paint4 =#283618;
  if (paletteNumber==1) {
    int randomColor = randomValue(3, 4);
    if (randomColor==3) {
      return paint3;
    }
    if (randomColor==4) {
      return paint4;
    }
  } else if (paletteNumber==2) {
    int randomColor = randomValue(1, 2);
    if (randomColor==1) {
      return paint1;
    }
    if (randomColor==2) {
      return paint2;
    }
  } else if (paletteNumber==3) {
    int randomColor = randomValue(1, 4);
    if (randomColor==1) {
      return paint1;
    }
    if (randomColor==2) {
      return paint2;
    } else {
      if (randomColor==3) {
        return paint3;
      }
      if (randomColor==4) {
        return paint4;
      }
    }
  }
  return 0; //I'm always forced to return an integer so I chose to return 0 (black) so if this method won't work I will see black objects in my painting
}

//MAIN
void setup() {
  size(1280, 720);
  surface.setLocation(0, 0);
  noStroke();
  drawCanvas(); //Draw the painting for the first time
}

void draw() {
  if (isCanvasGeneratorLocked) drawSign(name, surname, studentNumber); //Stable condition till pressed left mouse button
  else if (palette==0) drawCanvas(); //Generate the painting with default settings
  else drawCanvas(palette); //Generate the painting with custom settings
}
