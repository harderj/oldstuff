size(500,500);
smooth();
background(50);
float r = min(width,height);
float t = 0;
float mr = r*0.05;
ellipseMode(CENTER);
translate(width*0.5,height*0.5);
noStroke();
float ang1=-PI*0.5+t;
float ang2=PI*0.5+t;
fill(0);
arc(0,0,r,r,ang1,ang2);
fill(255);
arc(0,0,r,r,ang2,ang1+TWO_PI);
fill(0);
ellipse(cos(ang1)*r*0.25,sin(ang1)*r*0.25,r*0.5,r*0.5);
fill(255);
ellipse(cos(ang2)*r*0.25,sin(ang2)*r*0.25,r*0.5,r*0.5);
fill(0);
ellipse(cos(ang2)*r*0.25,sin(ang2)*r*0.25,mr,mr);
fill(255);
ellipse(cos(ang1)*r*0.25,sin(ang1)*r*0.25,mr,mr);
