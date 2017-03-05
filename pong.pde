
float playerx = 1950;
float playery = 900;
float computerx = 50;
float computery = 50;
float ballspeedx = 5;
float ballspeedy = 5;
float playerpaddlewidth = 200;
float computerpaddlewidth = 200;
float computerspeed = 2;
float playerspeed = 10;
float ballx = 1000;
float bally = 500;
float balldiameter = 50;
int pointscomputer = 0;
int pointsplayer = 0;
float randomvalue = 0;
float ballxp1 = ballx;
float ballxp2 = ballx;
float ballxp3 = ballx;
float ballyp1 = bally;
float ballyp2 = bally;
float ballyp3 = bally;
float counter = 0;




void setup(){
  noStroke();
  size(2000,1000);
  background(255);
}

void draw(){
  computerMove();
  ballMove();
  score();
  background(255);
  rectMode(CORNERS);
  fill(200);
  textSize(100);
  text("COMPUTER",200,200);
  text("PLAYER",1200,200);
  textSize(300);
  text(pointscomputer,300,500);
  text(pointsplayer,1400,500);
  rect(975,0,1025,1000);
  fill(50);
  rectMode(CENTER);
  rect(playerx,playery,20,playerpaddlewidth);
  rect(computerx,computery,20,computerpaddlewidth);
  ellipseMode(CENTER);



  

  fill(100,100);
  ellipse(ballxp1,ballyp1,balldiameter,balldiameter);
  fill(150,100);
  ellipse(ballxp2,ballyp2,balldiameter,balldiameter);
  fill(200,100);
  ellipse(ballxp3,ballyp3,balldiameter,balldiameter);
  fill(50,255);
  ellipse(ballx,bally,balldiameter,balldiameter);
  


  counter = counter + 1;
  if (counter > 6){
    ballxp1 = ballx;
    ballyp1 = bally;
  } 
  if (counter > 10){
    ballxp2 = ballxp1;
    ballyp2 = ballyp1;
  }
  if (counter > 16){
    ballxp3 = ballxp2;
    ballyp3 = ballyp2;
    counter = 0;
  }
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (playery > playerpaddlewidth/2){
        playery = playery - playerspeed;
      }
    } else if (keyCode == DOWN) {
      if (playery < 1000-(playerpaddlewidth/2)){
        playery = playery + playerspeed;
      }
    } 
  }
}

void computerMove(){
  
  if ((computery - bally) > 0){
    computery = computery - computerspeed;
  }
  
  if ((computery - bally) < 0){
    computery = computery + computerspeed;
  }
  
  
}

void ballMove(){
  
  ballhit();
  ballx = ballx + ballspeedx;
  bally = bally + ballspeedy;
  
}

void ballhit(){
   
  if (bally < balldiameter/2){
    bally = balldiameter/2;
  }
  
  if (bally == balldiameter/2){
    ballspeedy = -(ballspeedy);
  }
  
  if (bally > (1000-balldiameter/2)){
    bally = 1000-balldiameter/2;
  }
  
  if (bally == (1000-balldiameter/2)){
    ballspeedy = -(ballspeedy);
  }
 
  
  if (ballx<(computerx+balldiameter/2) && bally < (computery+computerpaddlewidth/2) && bally > (computery-computerpaddlewidth/2)){
    ballspeedx = -(ballspeedx);
    ballspeedy = ballspeedy*(((bally-computery)/sqrt((bally-computery)*(bally-computery)))+random(5)/1000);
    if (bally == computery){
      ballspeedy = -ballspeedy;
    }
  }
  
  if (ballx>(playerx-balldiameter/2) && bally < (playery+playerpaddlewidth/2) && bally > (playery-playerpaddlewidth/2)){
    ballspeedx = -(ballspeedx);
    ballspeedy = ballspeedy*(((bally-playery)/sqrt((bally-playery)*(bally-playery)))+random(5)/1000);
    if (bally == playery){
      ballspeedy = -ballspeedy;
    }
  }
  
}

void score(){
  if (ballx < -10) {
    pointsplayer = pointsplayer + 1;
    ballx = 1000;
    bally = 500;
    randomvalue = random(2);
    if (randomvalue > 1){
      ballspeedx = ballspeedx + 1;
    }
    if (randomvalue < 1){
      ballspeedy = ballspeedy + 1;
    }
    
    computerspeed = computerspeed + 1;
  }
  
  if (ballx > 2010) {
    pointscomputer = pointscomputer + 1;
    ballx = 1000;
    bally = 500;
    if (ballspeedx < 10 && ballspeedy < 10){
      randomvalue = random(2);
      if (randomvalue > 1){
        ballspeedx = ballspeedx - 1;
      }
      if (randomvalue < 1){
        ballspeedy = ballspeedy - 1;
      }
    }
    if (computerspeed >= 2){
      computerspeed = computerspeed - 1;
    }
  }
}