float h, m, s;

void setup()
{
  size(550,550);
}

void draw()
{
  background(0);
  translate(width/2, height/2);  
  
  h = hour();
  m = minute();
  s = second();
  
  //bezel
  noFill();
  stroke(#FFFFFF);
  strokeWeight(1);
  circle(0,0,500);
  
  //generate seconds
  for(int i = 0; i<60; i++)
  {
    pushMatrix();
      rotate(radians(360/60*i));
      translate(245,0);
      strokeWeight(1);
      if(i%5==0)
      {fill(#FFFFFF);noStroke();}
      else
      {noFill();stroke(#FFFFFF);}
      circle(0, 0, 5);
    popMatrix();
  }
  
  //second hand
  pushMatrix();
    rotate(radians(s/60*360));
    stroke(#FF0000);
    strokeWeight(1);
    line(0,0,0,-235);
  popMatrix();
  
  //minute hand
  pushMatrix();
    rotate(radians((m/60*360) + (s/60/60*360)));
    stroke(#FFFFFF);
    strokeWeight(2);
    line(0,0,0,-175);
  popMatrix();
  
  //hour hand
  pushMatrix();
    rotate(radians(h/12*360 + (((m/60*360) + (s/60/60*360))/60)));
    stroke(#FFFFFF);
    strokeWeight(4);
    line(0,0,0,-100);
  popMatrix();
  
  //center
  fill(#FFFFFF);
  noStroke();
  circle(0,0,20);
  
  //digital clock
  noFill();
  stroke(#FFFFFF);
  strokeWeight(1);
  rectMode(CENTER);
  rect(0,200,60,25);
  textAlign(CENTER, CENTER);
  text(hour()+":"+minute()+":"+second(), 0, 200);
}
