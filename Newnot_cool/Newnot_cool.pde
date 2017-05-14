
float[][] T;
float[][] Tnext;

float t;
void setup(){
  t = 0;
  size(1000,1000);
  T = new float[100][100];
  Tnext = new float[100][100];
  for(int i = 0; i < 100; i++){
      for(int j = 0; j < 100; j++){
          T[i][j] = 0; 
      }
  }
  T[50][51] = 100;
  T[50][50] = 100;
  T[51][50] = 100;
  T[51][51] = 100;
}

void draw(){
  for(int i = 0; i < 100; i++){
      for(int j = 0; j < 100; j++){
        fill(T[i][j],0,0);
        rect((i*10),(j*10),10,10);
      }
  }
  t = t + 0.1;
  T = elapse(T,t);
}

float[][] elapse(float T1[][], float t){
  float[][] Tout = new float[100][100];
  for(int i = 10; i < 90; i++){
      for(int j = 10; j < 90; j++){
        Tout[i][j] = 0;
        float AMB = 0;
        AMB =       T1[i][j-1];
        AMB = AMB + T1[i][j+1];
        AMB = AMB + T1[i+1][j];
        AMB = AMB + T1[i-1][j];
        AMB = AMB / 4;
        
        // Rect hotter than neighbours
        if(T1[i][j] > AMB){
          
          float a = 1 * exp(-t) + AMB;
          Tout[i][j] += a;
        }
        // Rect cooler than neighbours
        else{
          float a = 1 * exp(t) + AMB;
          Tout[i][j] += a;
        }
      }
  }
  return Tout;
}
