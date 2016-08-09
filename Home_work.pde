// Number of columns and rows in the grid
int cols = 100;
int rows = 100;
 //two nested loops. This gives us a counter variable for every column
 //and every row in the matrix.
Cell[][] grid;
float theta = 0.0;
    
    //Creates a "new" object. The keyword new is typically used similarly to the
    //applications in the above example. In this example, a new object "h1" of 
    //the datatype "HLine" is created. On the following line, a new array of 
    //floats called "speeds" is created.
  

void setup() {
  size(700,600);
  smooth();
  // For every column I, visit every row J.
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*100,j*100,50,50,i+j);
    }
  }
}

void draw() {
  background(0);
  

  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.
  
  theta += 0.01;
  float x = (sin(theta) + 1) * width/2;
  float y = (sin(theta) + 1) * width/2;
 
  fill(255,255,255);
  ellipse(x,height/2,50,100);
  fill(175, 200, 220);
  ellipse(y,height/2,60,60);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      // Oscillate and display each object
      
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  //(move or swing back and forth at a regular speed)
  void oscillate() {
    angle += 0.05; 
  }

//Each cell is a rectangle whose brightness oscillates 
// from 0-255 with a sine function.

  void display() {
    stroke(250);
    // Color calculated using sine wave
    fill(125+125*sin(angle));
    rect(x,y,w,h);
    fill(100,50,50);
  }
}
  