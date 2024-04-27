PImage palta;
void setup(){
size(800,600);
background(#D4F714);
 palta = loadImage("palta.jpg.jpg");

}
void draw(){
  image(palta,0,0,400,400);
  fill(#E4F068);
  strokeWeight(18);
  stroke(#99C608);
ellipse(610,208,290,325);
stroke(#A07506);
fill(#CBA208);
circle(610,218,148);

}
  
