class Cloud {
  
  void Clouds (){
    println("printing some text to the message window!");
    
    color c = color(255, 255, 0);  // Define color 'c'
    fill(c);  // Use color variable 'c' as fill color
    noStroke();  // Don't draw a stroke around shapes
    ellipse(25, 25, 80, 80);  // Draw left circle

    // Using only one value with color()
    // generates a grayscale value.
    c = color(255,255,255);  // Update 'c' with grayscale value
    fill(c);  // Use updated 'c' as fill color
    ellipse(75, 75, 80, 80);  // Draw right circle
  }
  
}