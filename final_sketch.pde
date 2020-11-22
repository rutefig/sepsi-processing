import processing.serial.*;
import processing.sound.*;

//arduino variables
Serial myPort;  // Create object from Serial Class
String val;    // Data received from the serial port

SoundFile initialSound, approximationSound, climaxSound;

//animation variables
float dist, val1;
float x, y = 0.0;        // Default xy-coordinate
float speed = 8;     // Speed, work with scale
float scale = 1;     // Scale, currently in meters
float easing = 0.3;  // Numbers 0.0 to 1.0
  
float x1, y1, x2, y2, x3, y3 = 0.0;

float x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11 = 0.0;

float x12, y12, x13, y13, x14, y14, x15, y15, x16, y16, x17, y17, x18, y18, x19, y19, x20, y20 = 0.0;
  
float x21, y21, x22, y22, x23, y23, x24, y24, x25, y25 = 0.0;

float x26, y26, x27, y27, x28, y28, x29, y29, x30, y30, x31, y31, x32, y32, x33, y33, x34, y34, x35, y35 = 0.0;

float x36, y36, x37, y37, x38, y38, x39, y39, x40, y40, x41, y41, x42, y42 = 0.0;

float x43, y43, x44, y44, x45, y45, x46, y46, x47, y47, x48, y48 = 0.0;

float x49, y49, x50, y50, x51, y51, x52, y52, x53, y53, x54, y54, x55, y55, x56, y56, x57, y57, x58, y58 = 0.0;

float x59, y59, x60, y60, x61, y61, x62, y62, x63, y63, x64, y64, x65, y65, x66, y66, x67, y67, x68, y68, x69, y69, x70, y70, x71, y71, x72, y72, x73, y73 = 0.0;


PShape logo, layer;
// Ellipses
PShape ellipse1, ellipse2, ellipse3;
// Brown Balls 
PShape bball1, bball2, bball3, bball4, bball5, bball6, bball7, bball8, bball9;
// Green Balls
PShape gball1, gball2, gball3, gball4, gball5, gball6, gball7, gball8;
// SEPSI word
PShape title1, title2, title3, title4, title5;
// Electronic word
PShape st1_1, st1_2, st1_3, st1_4, st1_5, st1_6, st1_7, st1_8, st1_9, st1_10;
// Systems word
PShape st2_1, st2_2, st2_3, st2_4, st2_5, st2_6, st2_7;
// Signal word
PShape st3_1, st3_2, st3_3, st3_4, st3_5, st3_6;
// Processing word
PShape st4_1, st4_2, st4_3, st4_4, st4_5, st4_6, st4_7, st4_8, st4_9, st4_10;
// Instrumentation word
PShape st5_1, st5_2, st5_3, st5_4, st5_5, st5_6, st5_7, st5_8, st5_9, st5_10, st5_11, st5_12, st5_13, st5_14, st5_15;

float user_distance = 30; // to simulate user distance

Waveform waveform;
int samples = 100;
float xText, yText;

void setup() {
  size(1280, 720);
  background(0);
  // connect to arduino
  //connectArduino();
  // initialize shapes
  initializeShapes("logo.svg");
  
  // setup initial positions
  // setup initial sound
  setupSound("Debussy_Reverie.wav", "Vivaldi_Spring.wav", "Strauss_DonJuan.wav");
  initialSound.play();
  waveform = new Waveform(this, samples);
  waveform.input(initialSound);
}

void draw() {
  
  // receive distance from arduino
  
  user_distance = user_distance - 0.01;
  println(user_distance);
  
  // update sound
  // set up final sound
  updateSound();
  
  // update positions
  // setup final positions
  background(0);
  display(user_distance);
}

void setupSound(String initial, String aproximation, String end) {
  initialSound = new SoundFile(this, initial);
  approximationSound = new SoundFile(this, aproximation);
  climaxSound = new SoundFile(this, end);
}

void updateSound() {
  if(user_distance > 20) {
    if(approximationSound.isPlaying()) {
      approximationSound.stop();
    }
    if(climaxSound.isPlaying()) {
      climaxSound.stop();
    }
    if(!initialSound.isPlaying()) {
      initialSound.loop();
    }
  }
  if(user_distance <= 20 && user_distance > 1) {
    if(!approximationSound.isPlaying()) {
      //initialSound.stop();
      approximationSound.loop();
      initialSound.stop();
    }
  }
  if(user_distance <= 1) {
    if(!climaxSound.isPlaying()) {
      approximationSound.stop();
      climaxSound.play();
    }
  }
}

void connectArduino() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void initializeShapes(String svgfile) {
  logo = loadShape(svgfile);
  layer = logo.getChild(1);
  // initialize ellipses from right to left
  ellipse1 = layer.getChild("path3568");
  ellipse2 = layer.getChild("path3570");
  ellipse3 = layer.getChild("path3574");
  // initialize brown balls from top to bottom
  bball1 = layer.getChild("_64541720");
  bball2 = layer.getChild("_64537368");
  bball3 = layer.getChild("_64769600");  
  bball4 = layer.getChild("_63948184");
  bball5 = layer.getChild("_64540632");
  bball6 = layer.getChild("_64756672");
  bball7 = layer.getChild("_64544512");
  bball8 = layer.getChild("_63948376");
  bball9 = layer.getChild("_64542944");
  // initialize green balls
  gball1 = layer.getChild("_63948112");
  gball2 = layer.getChild("_64757600");
  gball3 = layer.getChild("_64550576");
  gball4 = layer.getChild("_64551664");
  gball5 = layer.getChild("_64538456");
  gball6 = layer.getChild("_64544032");
  gball7 = layer.getChild("_64552752");
  gball8 = layer.getChild("_64539544");
  // initialize SEPSI title
  title1 = layer.getChild("text3616-1");
  title2 = layer.getChild("text3616-3");
  title3 = layer.getChild("text3616-5");
  title4 = layer.getChild("text3616-0");
  title5 = layer.getChild("text3616-2");
  // initialize "Electronic" word
  st1_1 = layer.getChild("text890");
  st1_2 = layer.getChild("text894");
  st1_3 = layer.getChild("text898");
  st1_4 = layer.getChild("text902");
  st1_5 = layer.getChild("text906");
  st1_6 = layer.getChild("text910");
  st1_7 = layer.getChild("text914");
  st1_8 = layer.getChild("text918");
  st1_9 = layer.getChild("text922");
  st1_10 = layer.getChild("text926");
  // initialize "Systems" word  
  st2_1 = layer.getChild("text890-9");
  st2_2 = layer.getChild("text894-8");
  st2_3 = layer.getChild("text898-5");
  st2_4 = layer.getChild("text902-9");
  st2_5 = layer.getChild("text906-3");
  st2_6 = layer.getChild("text910-5");
  st2_7 = layer.getChild("text914-1");
  // initialize "Signal" word  
  st3_1 = layer.getChild("text1042");
  st3_2 = layer.getChild("text1046");
  st3_3 = layer.getChild("text1050");
  st3_4 = layer.getChild("text1054");
  st3_5 = layer.getChild("text1058");
  st3_6 = layer.getChild("text1062");
  // initialize "Processing" word
  st4_1 = layer.getChild("text1066");
  st4_2 = layer.getChild("text1070");
  st4_3 = layer.getChild("text1074");
  st4_4 = layer.getChild("text1078");
  st4_5 = layer.getChild("text1082");
  st4_6 = layer.getChild("text1086");
  st4_7 = layer.getChild("text1090");
  st4_8 = layer.getChild("text1094");
  st4_9 = layer.getChild("text1098");
  st4_10 = layer.getChild("text1102");
  // initialize "Instrumentation" word
  st5_1 = layer.getChild("text1140");
  st5_2 = layer.getChild("text1144");
  st5_3 = layer.getChild("text1148");
  st5_4 = layer.getChild("text1152");
  st5_5 = layer.getChild("text1156");
  st5_6 = layer.getChild("text1160");
  st5_7 = layer.getChild("text1164");
  st5_8 = layer.getChild("text1168");
  st5_9 = layer.getChild("text1172");
  st5_10 = layer.getChild("text1176");
  st5_11 = layer.getChild("text1180");
  st5_12 = layer.getChild("text1184");
  st5_13 = layer.getChild("text1188");
  st5_14 = layer.getChild("text1192");
  st5_15 = layer.getChild("text1196");
}

void display(float dist) {
  //dist = (dist - 1);  // define posição 0
  
  x = width/3;
  y = height/3;
  
  if(dist > 20) {
    initialAnimation();
  }
  else if (dist >= 1) { // animation
    animation(x, y, dist);
  } else { // so it doesn't create a reverse animation
    defaultPosition();
  }
}

void initialAnimation() {
  // Perform the analysis
  int c = 102;
  waveform.analyze();
  xText = width / 2;
  yText = height / 3;
  textSize(56);
  text("Come here", xText, yText);
  fill(0, c-10, 153);
  
  stroke(random(0,255), random(0,255), random(0,255));
  strokeWeight(2);
  noFill();
  
  beginShape();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, 0, height)
    );
  }
  endShape();
}

void defaultPosition() {
  // Ellipses
  
  shape(ellipse1, x, y);
  shape(ellipse2, x, y);
  shape(ellipse3, x, y);
  
  // Green balls
  shape(gball1, x, y);
  shape(gball2, x, y);
  shape(gball3, x, y);
  shape(gball4, x, y);
  shape(gball5, x, y);
  shape(gball6, x, y);
  shape(gball7, x, y);
  shape(gball8, x, y);
  
  // Brown balls
  shape(bball1, x, y);
  shape(bball2, x, y);
  shape(bball3, x, y);
  shape(bball4, x, y);
  shape(bball5, x, y);
  shape(bball6, x, y);
  shape(bball7, x, y);
  shape(bball8, x, y);
  shape(bball9, x, y);
  
  // Title
  shape(title1, x, y);
  shape(title2, x, y);
  shape(title3, x, y);
  shape(title4, x, y);
  shape(title5, x, y);
  
  // Electronic
  shape(st1_1, x, y);
  shape(st1_2, x, y);
  shape(st1_3, x, y);
  shape(st1_4, x, y);
  shape(st1_5, x, y);
  shape(st1_6, x, y);
  shape(st1_7, x, y);
  shape(st1_8, x, y);
  shape(st1_9, x, y);
  shape(st1_10, x, y);
  
  // Systems
  shape(st2_1, x, y);
  shape(st2_2, x, y);
  shape(st2_3, x, y);
  shape(st2_4, x, y);
  shape(st2_5, x, y);
  shape(st2_6, x, y);
  shape(st2_7, x, y);
  
  // Signal
  shape(st3_1, x, y);
  shape(st3_2, x, y);
  shape(st3_3, x, y);
  shape(st3_4, x, y);
  shape(st3_5, x, y);
  shape(st3_6, x, y);
  
  // Processing
  shape(st4_1, x, y);
  shape(st4_2, x, y);
  shape(st4_3, x, y);
  shape(st4_4, x, y);
  shape(st4_5, x, y);
  shape(st4_6, x, y);
  shape(st4_7, x, y);
  shape(st4_8, x, y);
  shape(st4_9, x, y);
  shape(st4_10, x, y);
  
  // Instrumentation
  shape(st5_1, x, y);
  shape(st5_2, x, y);
  shape(st5_3, x, y);
  shape(st5_4, x, y);
  shape(st5_5, x, y);
  shape(st5_6, x, y);
  shape(st5_7, x, y);
  shape(st5_8, x, y);
  shape(st5_9, x, y);
  shape(st5_10, x, y);
  shape(st5_11, x, y);
  shape(st5_12, x, y);
  shape(st5_13, x, y);
  shape(st5_14, x, y);
  shape(st5_15, x, y);
}
  
void animation(float x, float y, float dist) {
  float z = speed * dist;
  
  // Ellipses
  float dx1 = z*cos(radians(225)) - x1;
  float dy1 = z*sin(radians(225)) - y1;
  float dx2 = z*cos(radians(135)) - x2;
  float dy2 = z*sin(radians(135)) - y2;
  float dx3 = z*cos(radians(45)) - x3;
  float dy3 = z*sin(radians(45)) - y3;
  
  // Ellipses
  if (abs(dx1) > 1) {
    x1 += dx1 * easing;
  }
  if (abs(dy1) > 1) {
    y1 += dy1 * easing;
  }
  if (abs(dx2) > 1) {
    x2 += dx2 * easing;
  }
  if (abs(dy2) > 1) {
    y2 += dy2 * easing;
  }
  if (abs(dx3) > 1) {
    x3 += dx3 * easing;
  }
  if (abs(dy3) > 1) {
    y3 += dy3 * easing;
  }
  
  // Ellipses
  shape(ellipse1, x + x1, y + y1);
  shape(ellipse2, x + x2, y + y2);
  shape(ellipse3, x + x3, y + y3);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  
  // Green balls
  float dx4 = z*cos(radians(225)) - x4;
  float dy4 = z*sin(radians(225)) - y4;
  float dx5 = z*cos(radians(135)) - x5;
  float dy5 = z*sin(radians(315)) - y5;
  float dx6 = z*cos(radians(135)) - x6;
  float dy6 = z*sin(radians(135)) - y6;  
  float dx7 = z*cos(radians(45)) - x7;
  float dy7 = z*sin(radians(45)) - y7;
  float dx8 = 0 - x8;
  float dy8 = (-z) - y8;
  float dx9 = 0 - x9;
  float dy9 = z - y9;  
  float dx10 = (-z) - x10;
  float dy10 = 0 - y10;
  float dx11 = z - x11;
  float dy11 = 0 - y11;
  
  // Green balls
  if (abs(dx4) > 1) {
    x4 += dx4 * easing;
  }
  if (abs(dy4) > 1) {
    y4 += dy4 * easing;
  }
  if (abs(dx5) > 1) {
    x5 += dx5 * easing;
  }
  if (abs(dy5) > 1) {
    y5 += dy5 * easing;
  }
  if (abs(dx6) > 1) {
    x6 += dx6 * easing;
  }
  if (abs(dy6) > 1) {
    y6 += dy6 * easing;
  }
  if (abs(dx7) > 1) {
    x7 += dx7 * easing;
  }
  if (abs(dy7) > 1) {
    y7 += dy7 * easing;
  }
  if (abs(dx8) > 1) {
    x8 += dx8 * easing;
  }
  if (abs(dy8) > 1) {
    y8 += dy8 * easing;
  }
  if (abs(dx9) > 1) {
    x9 += dx9 * easing;
  }
  if (abs(dy9) > 1) {
    y9 += dy9 * easing;
  }
  if (abs(dx10) > 1) {
    x10 += dx10 * easing;
  }
  if (abs(dy10) > 1) {
    y10 += dy10 * easing;
  }
  if (abs(dx11) > 1) {
    x11 += dx11 * easing;
  }
  if (abs(dy11) > 1) {
    y11 += dy11 * easing;
  }
  
  // Green balls
  shape(gball1, x + x4, y + y4);
  shape(gball2, x + x5, y + y5);
  shape(gball3, x + x6, y + y6);
  shape(gball4, x + x7, y + y7);
  shape(gball5, x + x8, y + y8);
  shape(gball6, x + x9, y + y9);
  shape(gball7, x + x10, y + y10);
  shape(gball8, x + x11, y + y11);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  
  // Brown balls
  float dx12 = 0 - x12;
  float dy12 = (-z) - y12;
  float dx13 = z*cos(radians(247.5)) - x13;
  float dy13 = z*sin(radians(247.5)) - y13;
  float dx14 = z*cos(radians(225)) - x14;
  float dy14 = z*sin(radians(225)) - y14;  
  float dx15 = z*cos(radians(202.5)) - x15;
  float dy15 = z*sin(radians(202.5)) - y15;
  float dx16 = (-z) - x16;
  float dy16 = 0 - y16;
  float dx17 = z*cos(radians(157.5)) - x17;
  float dy17 = z*sin(radians(157.5)) - y17;  
  float dx18 = z*cos(radians(135)) - x18;
  float dy18 = z*sin(radians(135)) - y18;
  float dx19 = z*cos(radians(112.5)) - x19;
  float dy19 = z*sin(radians(112.5)) - y19;
  float dx20 = 0 - x20;
  float dy20 = z - y20;
  
  // Brown balls
  if (abs(dx12) > 1) {
    x12 += dx12 * easing;
  }
  if (abs(dy12) > 1) {
    y12 += dy12 * easing;
  }
  if (abs(dx13) > 1) {
    x13 += dx13 * easing;
  }
  if (abs(dy13) > 1) {
    y13 += dy13 * easing;
  }
  if (abs(dx14) > 1) {
    x14 += dx14 * easing;
  }
  if (abs(dy14) > 1) {
    y14 += dy14 * easing;
  }
  if (abs(dx15) > 1) {
    x15 += dx15 * easing;
  }
  if (abs(dy15) > 1) {
    y15 += dy15 * easing;
  }
  if (abs(dx16) > 1) {
    x16 += dx16 * easing;
  }
  if (abs(dy16) > 1) {
    y16 += dy16 * easing;
  }
  if (abs(dx17) > 1) {
    x17 += dx17 * easing;
  }
  if (abs(dy17) > 1) {
    y17 += dy17 * easing;
  }
  if (abs(dx18) > 1) {
    x18 += dx18 * easing;
  }
  if (abs(dy18) > 1) {
    y18 += dy18 * easing;
  }
  if (abs(dx19) > 1) {
    x19 += dx19 * easing;
  }
  if (abs(dy19) > 1) {
    y19 += dy19 * easing;
  }
  if (abs(dx20) > 1) {
    x20 += dx20 * easing;
  }
  if (abs(dy20) > 1) {
    y20 += dy20 * easing;
  }
  // Brown balls
  shape(bball1, x + x12, y + y12);
  shape(bball2, x + x13, y + y13);
  shape(bball3, x + x14, y + y14);
  shape(bball4, x + x15, y + y15);
  shape(bball5, x + x16, y + y16);
  shape(bball6, x + x17, y + y17);
  shape(bball7, x + x18, y + y18);
  shape(bball8, x + x19, y + y19);
  shape(bball9, x + x20, y + y20);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  
  // Title
  float dx21 = z*cos(radians(215)) - x21;
  float dy21 = z*sin(radians(215)) - y21;
  float dx22 = z*cos(radians(233)) - x22;
  float dy22 = z*sin(radians(233)) - y22;
  float dx23 = z*cos(radians(260)) - x23;
  float dy23 = z*sin(radians(260)) - y23;
  float dx24 = z*cos(radians(307)) - x24;
  float dy24 = z*sin(radians(307)) - y24;
  float dx25 = z*cos(radians(323)) - x25;
  float dy25 = z*sin(radians(323)) - y25;
  
  // Title
  if (abs(dx21) > 1) {
    x21 += dx21 * easing;
  }
  if (abs(dy21) > 1) {
    y21 += dy21 * easing;
  }
  if (abs(dx22) > 1) {
    x22 += dx22 * easing;
  }
  if (abs(dy22) > 1) {
    y22 += dy22 * easing;
  }
  if (abs(dx23) > 1) {
    x23 += dx23 * easing;
  }
  if (abs(dy23) > 1) {
    y23 += dy23 * easing;
  }
  if (abs(dx24) > 1) {
    x24 += dx24 * easing;
  }
  if (abs(dy24) > 1) {
    y24 += dy24 * easing;
  }
  if (abs(dx25) > 1) {
    x25 += dx25 * easing;
  }
  if (abs(dy25) > 1) {
    y25 += dy25 * easing;
  }
  // Title
  shape(title1, x + x21, y + y21);
  shape(title2, x + x22, y + y22);
  shape(title3, x + x23, y + y23);
  shape(title4, x + x24, y + y24);
  shape(title5, x + x25, y + y25);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  
  // Electronic
  float dx26 = z*cos(radians(187)) - x26;
  float dy26 = z*sin(radians(187)) - y26;
  float dx27 = z*cos(radians(187.5)) - x27;
  float dy27 = z*sin(radians(187.5)) - y27;
  float dx28 = z*cos(radians(187)) - x28;
  float dy28 = z*sin(radians(187)) - y28;  
  float dx29 = z*cos(radians(188)) - x29;
  float dy29 = z*sin(radians(188)) - y29;
  float dx30 = z*cos(radians(190)) - x30;
  float dy30 = z*sin(radians(190)) - y30;
  float dx31 = z*cos(radians(191)) - x31;
  float dy31 = z*sin(radians(191)) - y31;  
  float dx32 = z*cos(radians(194)) - x32;
  float dy32 = z*sin(radians(194)) - y32;
  float dx33 = z*cos(radians(202)) - x33;
  float dy33 = z*sin(radians(202)) - y33;
  float dx34 = z*cos(radians(218)) - x34;
  float dy34 = z*sin(radians(218)) - y34;
  float dx35 = z*cos(radians(237)) - x35;
  float dy35 = z*sin(radians(237)) - y35;
  
  // Electronic
  if (abs(dx26) > 1) {
    x26 += dx26 * easing;
  }
  if (abs(dy26) > 1) {
    y26 += dy26 * easing;
  }
  if (abs(dx27) > 1) {
    x27 += dx27 * easing;
  }
  if (abs(dy27) > 1) {
    y27 += dy27 * easing;
  }
  if (abs(dx28) > 1) {
    x28 += dx28 * easing;
  }
  if (abs(dy28) > 1) {
    y28 += dy28 * easing;
  }
  if (abs(dx29) > 1) {
    x29 += dx29 * easing;
  }
  if (abs(dy29) > 1) {
    y29 += dy29 * easing;
  }
  if (abs(dx30) > 1) {
    x30 += dx30 * easing;
  }
  if (abs(dy30) > 1) {
    y30 += dy30 * easing;
  }
  if (abs(dx31) > 1) {
    x31 += dx31 * easing;
  }
  if (abs(dy31) > 1) {
    y31 += dy31 * easing;
  }
  if (abs(dx32) > 1) {
    x32 += dx32 * easing;
  }
  if (abs(dy32) > 1) {
    y32 += dy32 * easing;
  }
  if (abs(dx33) > 1) {
    x33 += dx33 * easing;
  }
  if (abs(dy33) > 1) {
    y33 += dy33 * easing;
  }
  if (abs(dx34) > 1) {
    x34 += dx34 * easing;
  }
  if (abs(dy34) > 1) {
    y34 += dy34 * easing;
  }
  if (abs(dx20) > 1) {
    x35 += dx35 * easing;
  }
  if (abs(dy35) > 1) {
    y35 += dy35 * easing;
  }
  
  // Electronic
  shape(st1_1, x + x26, y + y26);
  shape(st1_2, x + x27, y + y27);
  shape(st1_3, x + x28, y + y28);
  shape(st1_4, x + x29, y + y29);
  shape(st1_5, x + x30, y + y30);
  shape(st1_6, x + x31, y + y31);
  shape(st1_7, x + x32, y + y32);
  shape(st1_8, x + x33, y + y33);
  shape(st1_9, x + x34, y + y34);
  shape(st1_10, x + x35, y + y35);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
     
  // Systems
  float dx36 = z*cos(radians(324)) - x36;
  float dy36 = z*sin(radians(324)) - y36;
  float dx37 = z*cos(radians(346)) - x37;
  float dy37 = z*sin(radians(346)) - y37;
  float dx38 = z*cos(radians(349)) - x38;
  float dy38 = z*sin(radians(349)) - y38;
  float dx39 = z*cos(radians(351)) - x39;
  float dy39 = z*sin(radians(351)) - y39;
  float dx40 = z*cos(radians(352)) - x40;
  float dy40 = z*sin(radians(352)) - y40;
  float dx41 = z*cos(radians(354)) - x41;
  float dy41 = z*sin(radians(354)) - y41;
  float dx42 = z*cos(radians(355)) - x42;
  float dy42 = z*sin(radians(355)) - y42;
  
  // Systems
  if (abs(dx36) > 1) {
    x36 += dx36 * easing;
  }
  if (abs(dy36) > 1) {
    y36 += dy36 * easing;
  }
  if (abs(dx37) > 1) {
    x37 += dx37 * easing;
  }
  if (abs(dy37) > 1) {
    y37 += dy37 * easing;
  }
  if (abs(dx38) > 1) {
    x38 += dx38 * easing;
  }
  if (abs(dy38) > 1) {
    y38 += dy38 * easing;
  }
  if (abs(dx39) > 1) {
    x39 += dx39 * easing;
  }
  if (abs(dy39) > 1) {
    y39 += dy39 * easing;
  }
  if (abs(dx40) > 1) {
    x40 += dx40 * easing;
  }
  if (abs(dy40) > 1) {
    y40 += dy40 * easing;
  }
  if (abs(dx41) > 1) {
    x41 += dx41 * easing;
  }
  if (abs(dy41) > 1) {
    y41 += dy41 * easing;
  }
  if (abs(dx42) > 1) {
    x42 += dx42 * easing;
  }
  if (abs(dy42) > 1) {
    y42 += dy42 * easing;
  }
  
  // Systems
  shape(st2_1, x + x36, y + y36);
  shape(st2_2, x + x37, y + y37);
  shape(st2_3, x + x38, y + y38);
  shape(st2_4, x + x39, y + y39);
  shape(st2_5, x + x40, y + y40);
  shape(st2_6, x + x41, y + y41);
  shape(st2_7, x + x42, y + y42);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
     
  // Signal
  float dx43 = z*cos(radians(170)) - x43;
  float dy43 = z*sin(radians(170)) - y43;
  float dx44 = z*cos(radians(168)) - x44;
  float dy44 = z*sin(radians(168)) - y44;
  float dx45 = z*cos(radians(166)) - x45;
  float dy45 = z*sin(radians(166)) - y45;
  float dx46 = z*cos(radians(164)) - x46;
  float dy46 = z*sin(radians(164)) - y46;
  float dx47 = z*cos(radians(161)) - x47;
  float dy47 = z*sin(radians(161)) - y47;
  float dx48 = z*cos(radians(158)) - x48;
  float dy48 = z*sin(radians(158)) - y48;
  
  // Signal
  if (abs(dx43) > 1) {
    x43 += dx43 * easing;
  }
  if (abs(dy43) > 1) {
    y43 += dy43 * easing;
  }
  if (abs(dx44) > 1) {
    x44 += dx44 * easing;
  }
  if (abs(dy44) > 1) {
    y44 += dy44 * easing;
  }
  if (abs(dx45) > 1) {
    x45 += dx45 * easing;
  }
  if (abs(dy45) > 1) {
    y45 += dy45 * easing;
  }
  if (abs(dx46) > 1) {
    x46 += dx46 * easing;
  }
  if (abs(dy46) > 1) {
    y46 += dy46 * easing;
  }
  if (abs(dx47) > 1) {
    x47 += dx47 * easing;
  }
  if (abs(dy47) > 1) {
    y47 += dy47 * easing;
  }
  if (abs(dx48) > 1) {
    x48 += dx48 * easing;
  }
  if (abs(dy48) > 1) {
    y48 += dy48 * easing;
  }
  
  // Signal
  shape(st3_1, x + x43, y + y43);
  shape(st3_2, x + x44, y + y44);
  shape(st3_3, x + x45, y + y45);
  shape(st3_4, x + x46, y + y46);
  shape(st3_5, x + x47, y + y47);
  shape(st3_6, x + x48, y + y48);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
        
  // Processing
  float dx49 = z*cos(radians(148)) - x49;
  float dy49 = z*sin(radians(148)) - y49;
  float dx50 = z*cos(radians(130)) - x50;
  float dy50 = z*sin(radians(130)) - y50;
  float dx51 = z*cos(radians(100)) - x51;
  float dy51 = z*sin(radians(100)) - y51;
  float dx52 = z*cos(radians(69)) - x52;
  float dy52 = z*sin(radians(69)) - y52;
  float dx53 = z*cos(radians(41)) - x53;
  float dy53 = z*sin(radians(41)) - y53;
  float dx54 = z*cos(radians(29)) - x54;
  float dy54 = z*sin(radians(29)) - y54;
  float dx55 = z*cos(radians(23)) - x55;
  float dy55 = z*sin(radians(23)) - y55;
  float dx56 = z*cos(radians(18)) - x56;
  float dy56 = z*sin(radians(18)) - y56;
  float dx57 = z*cos(radians(17)) - x57;
  float dy57 = z*sin(radians(17)) - y57;
  float dx58 = z*cos(radians(14)) - x58;
  float dy58 = z*sin(radians(14)) - y58;
  
  // Processing
  if (abs(dx49) > 1) {
    x49 += dx49 * easing;
  }
  if (abs(dy49) > 1) {
    y49 += dy49 * easing;
  }
  if (abs(dx50) > 1) {
    x50 += dx50 * easing;
  }
  if (abs(dy50) > 1) {
    y50 += dy50 * easing;
  }
  if (abs(dx51) > 1) {
    x51 += dx51 * easing;
  }
  if (abs(dy51) > 1) {
    y51 += dy51 * easing;
  }
  if (abs(dx52) > 1) {
    x52 += dx52 * easing;
  }
  if (abs(dy52) > 1) {
    y52 += dy52 * easing;
  }
  if (abs(dx53) > 1) {
    x53 += dx53 * easing;
  }
  if (abs(dy53) > 1) {
    y53 += dy53 * easing;
  }
  if (abs(dx54) > 1) {
    x54 += dx54 * easing;
  }
  if (abs(dy54) > 1) {
    y54 += dy54 * easing;
  }
  if (abs(dx55) > 1) {
    x55 += dx55 * easing;
  }
  if (abs(dy55) > 1) {
    y55 += dy55 * easing;
  }
  if (abs(dx56) > 1) {
    x56 += dx56 * easing;
  }
  if (abs(dy56) > 1) {
    y56 += dy56 * easing;
  }
  if (abs(dx57) > 1) {
    x57 += dx57 * easing;
  }
  if (abs(dy57) > 1) {
    y57 += dy57 * easing;
  }
  if (abs(dx58) > 1) {
    x58 += dx58 * easing;
  }
  if (abs(dy58) > 1) {
    y58 += dy58 * easing;
  }
  
  // Processing
  shape(st4_1, x + x49, y + y49);
  shape(st4_2, x + x50, y + y50);
  shape(st4_3, x + x51, y + y51);
  shape(st4_4, x + x52, y + y52);
  shape(st4_5, x + x53, y + y53);
  shape(st4_6, x + x54, y + y54);
  shape(st4_7, x + x55, y + y55);
  shape(st4_8, x + x56, y + y56);
  shape(st4_9, x + x57, y + y57);
  shape(st4_10, x + x58, y + y58);
  
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////
           
  // Instrumentation
  float dx59 = z*cos(radians(158)) - x59;
  float dy59 = z*sin(radians(158)) - y59;
  float dx60 = z*cos(radians(154)) - x60;
  float dy60 = z*sin(radians(154)) - y60;
  float dx61 = z*cos(radians(151)) - x61;
  float dy61 = z*sin(radians(151)) - y61;
  float dx62 = z*cos(radians(149)) - x62;
  float dy62 = z*sin(radians(149)) - y62;
  float dx63 = z*cos(radians(145)) - x63;
  float dy63 = z*sin(radians(145)) - y63;
  float dx64 = z*cos(radians(139)) - x64;
  float dy64 = z*sin(radians(139)) - y64;
  float dx65 = z*cos(radians(128)) - x65;
  float dy65 = z*sin(radians(128)) - y65;
  float dx66 = z*cos(radians(110)) - x66;
  float dy66 = z*sin(radians(110)) - y66;
  float dx67 = z*cos(radians(93)) - x67;
  float dy67 = z*sin(radians(93)) - y67;
  float dx68 = z*cos(radians(81)) - x68;
  float dy68 = z*sin(radians(81)) - y68;       
  float dx69 = z*cos(radians(68)) - x69;
  float dy69 = z*sin(radians(68)) - y69;
  float dx70 = z*cos(radians(56)) - x70;
  float dy70 = z*sin(radians(56)) - y70;
  float dx71 = z*cos(radians(50)) - x71;
  float dy71 = z*sin(radians(50)) - y71;
  float dx72 = z*cos(radians(44)) - x72;
  float dy72 = z*sin(radians(44)) - y72;
  float dx73 = z*cos(radians(37)) - x73;
  float dy73 = z*sin(radians(37)) - y73;
  
  // Instrumentation
  if (abs(dx59) > 1) {
    x59 += dx59 * easing;
  }
  if (abs(dy59) > 1) {
    y59 += dy59 * easing;
  }
  if (abs(dx60) > 1) {
    x60 += dx60 * easing;
  }
  if (abs(dy60) > 1) {
    y60 += dy60 * easing;
  }
  if (abs(dx61) > 1) {
    x61 += dx61 * easing;
  }
  if (abs(dy61) > 1) {
    y61 += dy61 * easing;
  }
  if (abs(dx62) > 1) {
    x62 += dx62 * easing;
  }
  if (abs(dy62) > 1) {
    y62 += dy62 * easing;
  }
  if (abs(dx63) > 1) {
    x63 += dx63 * easing;
  }
  if (abs(dy63) > 1) {
    y63 += dy63 * easing;
  }
  if (abs(dx64) > 1) {
    x64 += dx64 * easing;
  }
  if (abs(dy64) > 1) {
    y64 += dy64 * easing;
  }
  if (abs(dx65) > 1) {
    x65 += dx65 * easing;
  }
  if (abs(dy65) > 1) {
    y65 += dy65 * easing;
  }
  if (abs(dx66) > 1) {
    x66 += dx66 * easing;
  }
  if (abs(dy66) > 1) {
    y66 += dy66 * easing;
  }
  if (abs(dx67) > 1) {
    x67 += dx67 * easing;
  }
  if (abs(dy67) > 1) {
    y67 += dy67 * easing;
  }
  if (abs(dx68) > 1) {
    x68 += dx68 * easing;
  }
  if (abs(dy68) > 1) {
    y68 += dy68 * easing;
  }
  if (abs(dx69) > 1) {
    x69 += dx69 * easing;
  }
  if (abs(dy69) > 1) {
    y69 += dy69 * easing;
  }
  if (abs(dx70) > 1) {
    x70 += dx70 * easing;
  }
  if (abs(dy70) > 1) {
    y70 += dy70 * easing;
  }
  if (abs(dx71) > 1) {
    x71 += dx71 * easing;
  }
  if (abs(dy71) > 1) {
    y71 += dy71 * easing;
  }
  if (abs(dx72) > 1) {
    x72 += dx72 * easing;
  }
  if (abs(dy72) > 1) {
    y72 += dy72 * easing;
  }
  if (abs(dx73) > 1) {
    x73 += dx73 * easing;
  }
  if (abs(dy73) > 1) {
    y73 += dy73 * easing;
  }
  
  // Instrumentation
  shape(st5_1, x + x59, y + y59);
  shape(st5_2, x + x60, y + y60);
  shape(st5_3, x + x61, y + y61);
  shape(st5_4, x + x62, y + y62);
  shape(st5_5, x + x63, y + y63);
  shape(st5_6, x + x64, y + y64);
  shape(st5_7, x + x65, y + y65);
  shape(st5_8, x + x66, y + y66);
  shape(st5_9, x + x67, y + y67);
  shape(st5_10, x + x68, y + y68);
  shape(st5_11, x + x69, y + y69);
  shape(st5_12, x + x70, y + y70);
  shape(st5_13, x + x71, y + y71);
  shape(st5_14, x + x72, y + y72);
  shape(st5_15, x + x73, y + y73);
}
