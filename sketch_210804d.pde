int n =3;
int m = 4;
int cw, ch;

int gap =10;

int[]  backColor= new int[n*m];
boolean [] solved = new boolean[n*m];
int sel=-1;
int sec =-1;
int timer =-1;

PImage p1, p2, p3;

void setup() {
  size(500, 500);
  cw = width /n;
  ch = height/m;
  for (int i = 0; i < n*m; i++) {
    backColor[i] = (int)random(3);
    solved[i] =false;
  }


  p1 = loadImage("data/A.png");
  p2 = loadImage("data/2.png");
  p3 = loadImage("data/9.png");
}


void mouseClicked() {
  if (sel ==-1) {
    sel=(int)( (int)( mouseX/cw) + (int)(mouseY/ch)*n);
  } else {
    sec =mouseX/cw + (mouseY/ch)*n;
    timer =50;
  }
  print(sel);
}

void draw() {
  background(255);
  if ( timer > 0 ) 
    timer--;
  else if ( timer ==0)
  {
    if ( backColor[sel ]==backColor[sec]) {
      solved[sec] =true;
      solved[sel]=true;
    }

    sec=-1;
    sel=-1;
    timer =-1;
  }


  int ind =0;
  for (int j = 0; j <m; j++) {

    for ( int i= 0; i < n; i++) {
      if ( !solved[ind]) {
        if (sel ==ind || sec ==ind) {
          switch( backColor[ind]) {
          case 0:
            image(p1, i*cw+gap, j*ch+gap,cw-2*gap,ch-2*gap); 
            break;
          case 1:
             image(p2, i*cw+gap, j*ch+gap,cw-2*gap,ch-2*gap); 
            break;

          case 2:
             image(p3, i*cw+gap, j*ch+gap,cw-2*gap,ch-2*gap); 
            break;
          }
        } else
        {
          fill(255);
          rect( i* cw +gap, j *ch+gap, cw-2*gap, ch-2*gap);
        }


        
      }
      ind++;
    }
  }
}
