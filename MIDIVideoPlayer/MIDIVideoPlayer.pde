/*
 * MIDIVideoPlayer.pde
 *
 * Use your MIDI controller to play a videos
 *
 * Pete Prodoehl <pete@2xlnetworks.com>
 *
 */
 
 
import themidibus.*; // Import the library
MidiBus myBus;

import processing.video.*;
Movie myMovie;

PImage img;

boolean playTheMovie = false;

void setup() {
  size(1280, 720); // set the screen size, smaller for testing, but we will do full screen later
  background(200,200,200);
  MidiBus.list();
  myBus = new MidiBus(this, 1, 2);
  myMovie = new Movie(this, "video.mp4");
  img = loadImage("home.png");
}

void draw() {
  
  if (playTheMovie == true) {
   image(myMovie, 0, 0, 1280, 720);
   myMovie.play();
  }
}


void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn

  println("Button Pressed: "+pitch);

  if (pitch == 60) {
    println("Playing Video...");
    
    if (playTheMovie == true) {
      myMovie.jump(0);
    }
    
    playTheMovie = true;
  }
  
}


void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff

}


void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange

}

void movieEvent(Movie m) {
  m.read();
}
