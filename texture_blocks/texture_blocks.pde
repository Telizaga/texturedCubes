PImage diamond, glass, gt,gs,gb;

float rotx,roty;

void setup(){
 size(800,800,P3D); 
 diamond=loadImage("diamond.png");
 glass=loadImage("glass.png");
 gt=loadImage("gt.png");
 gs=loadImage("gs.png");
 gb=loadImage("gb.png");
 textureMode(NORMAL);
}

void draw(){
  background(0);
  cube(width/2,height/2,0,200,diamond);
  cube(width/2+200,height/2,0,200,glass);
  vcube(width/2-200,height/2,0,200,gt,gs,gb);
}
  
  void cube(float x, float y, float z, float size, PImage texture){
  pushMatrix();
  translate(x,y,z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  
  beginShape(QUADS);
  texture(texture);
  //top
  //     x, y, z, tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  //bottom
  vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  //front
  vertex(0,0,1,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  //back
  vertex(1,0,0,0,0);
  vertex(0,0,0,1,0);
  vertex(0,1,0,1,1);
  vertex(1,1,0,0,1);
  //left
  vertex(0,0,0,0,0);
  vertex(0,0,1,1,0);
  vertex(0,1,1,1,1);
  vertex(0,1,0,0,1);
  //right
  vertex(1,0,1,0,0);
  vertex(1,0,0,1,0);
  vertex(1,1,0,1,1);
  vertex(1,1,1,0,1);
  endShape();
  popMatrix();
}

void vcube(float x, float y, float z, float size, PImage top, PImage sides, PImage bot){
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  noStroke();
  
  beginShape(QUADS);
  texture(top);
  //top
  //     x, y, z, tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  endShape();
  
  beginShape(QUADS);
  texture(bot);
  //bottom
  vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  endShape();
  
  beginShape(QUADS);
  texture(sides);
  //front
  vertex(0,0,1,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  //back
  vertex(1,0,0,0,0);
  vertex(0,0,0,1,0);
  vertex(0,1,0,1,1);
  vertex(1,1,0,0,1);
  //left
  vertex(0,0,0,0,0);
  vertex(0,0,1,1,0);
  vertex(0,1,1,1,1);
  vertex(0,1,0,0,1);
  //right
  vertex(1,0,1,0,0);
  vertex(1,0,0,1,0);
  vertex(1,1,0,1,1);
  vertex(1,1,1,0,1);
  
  endShape();
  
  popMatrix();
}

void mouseDragged(){
  rotx = rotx+(pmouseY - mouseY)*0.01;
  roty = roty+(pmouseX - mouseX)*-0.01;
}
