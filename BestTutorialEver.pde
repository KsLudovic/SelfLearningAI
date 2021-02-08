Population test;
PVector goal  = new PVector(400, 10);
int gen = 1;

void setup() {
  size(800, 800); //size of the window
  frameRate(100);//increase this to make the dots go faster
  test = new Population(1000);//create a new population with 1000 members
}


void draw() { 
  background(255);
  fill(0, 102, 153);

  text("Gen: "+gen, 10, 60);
 

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  fill(200, 0, 200);

  rect(0, 300, 600, 10);


  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
    gen++;
  } else {
    //if any of the dots are still alive then update and then show them

    test.update();
    test.show();
  }
}
