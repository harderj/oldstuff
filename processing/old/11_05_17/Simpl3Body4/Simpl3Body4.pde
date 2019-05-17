
//double f=1000;
//general
double G = 0.0000004981367808; //Gravitational constant : Gm^3*Yg^-1*day^-2
//sun
float dSolar = 1.391; // Diameter : Gm
double mSolar = 1989100000; // Mass : Yg
//mercury
double smaMercury = 57.9091;
double mMercury = 330.22;
double vMercury = 4.135968;
float dMercury = 0.0048794;
//venus
double mVenus = 4868;
double vVenus = 3.025728; // Average orbital velocity : Gm/day
double smaVenus = 108.20893; // Semi Major Axis : Gm
float dVenus = 0.0121036;
//earth
double smaEarth = 149.598261;
double mEarth = 5973.6;
double vEarth = 2.572992;
float dEarth = 0.0127420;
//moon
double smaMoon = 0.384399;
double mMoon = 73.477;
double vMoon = 0.0883008;
float dMoon = 0.0034742;

Part p1, p2, p3;
double time = 0.0;
PFont font;

float scale = 1;

void setup(){

  size(500,500);
  smooth();
  font = loadFont("Serif-48.vlw");

  p1 = new Part(0,0,0,0,mSolar);
  p2 = new Part(0,smaEarth,vEarth,0,mEarth);
  p3 = new Part(0,smaEarth+smaMoon,vEarth+vMoon,0,mMoon);
}

void draw(){
  background(0);
  pushMatrix();
  translate(width*0.5-(float)p2.x*scale,height*0.5-(float)p2.y*scale);
  scale(scale);
  /*
  fill(0,0,0,2);
   rect(-10,-10,width+20,height+20);
   */

  double dt = 0.05;
  
  //for(int i=0;i<(int)(1/dt);i++){

    setAcc(p1, p2);
    setAcc(p1, p3);
    setAcc(p2, p3);

    p1.update(dt);
    p2.update(dt);
    p3.update(dt);
    
    time += dt;

    fill(255,255,150);
    p1.render(dSolar);
    fill(100,100,200);
    p2.render(dEarth);
    fill(150,150,0);
    p3.render(dMoon);
 // }
  
  popMatrix();
  fill(0,255,0);
  textFont(font, 10);
  text("Days: " + (int)time, width*0.01, height*0.99);
  stroke(255);
  float ls = 10; //lengthScale
  strokeWeight(1);
  line(width*(0.95-(ls*0.01)), height*0.95, width*0.95, height*0.95);
  String suffix = " Giga meters";
  float tmp = (int)log((float)(ls/scale));
  float sca = 1;
  if( tmp < 0 ){
    if( tmp < -3){
      
    }
    else{
      suffix = " Giga meters";
    }
  }
  text((int)(ls/scale) + " Gm", width*(0.95-(ls*0.01)), height*0.98);
}

void setAcc(Part p1, Part p2){
  double dx = p1.x-p2.x;
  double dy = p1.y-p2.y;
  double dist2 = dx*dx+dy*dy;
  double idist2 = 1/dist2;
  double ang = atan2((float)dy, (float)dx);//180/PI*atan( (float)(dy/dx) );
  double sinu = sin((float)ang);
  double cosi = cos((float)ang);

  p1.ax += -idist2*cosi*p2.m*G;
  p1.ay += -idist2*sinu*p2.m*G;
  p2.ax += idist2*cosi*p1.m*G;
  p2.ay += idist2*sinu*p1.m*G;
}

void keyPressed(){
  if(key=='a') scale *= 1.1;
  if(key=='s') scale /= 1.1;
}
