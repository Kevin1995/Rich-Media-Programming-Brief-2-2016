import processing.video.*;

Capture cam;
Scattered_Clouds myClouds;
ClearSky mySky;
Few_Cloud myFewClouds;
Broken_Cloud myBrokenClouds;

String Aziziya = "http://api.openweathermap.org/data/2.5/weather?q=Aziziya&APPID=d4133a486a98f68a0ec664960ac1c164&mode=xml";
String Washington = "http://api.openweathermap.org/data/2.5/weather?q=Washington&APPID=d4133a486a98f68a0ec664960ac1c164&mode=xml";
String Helsinki = "http://api.openweathermap.org/data/2.5/weather?q=Helsinki&APPID=d4133a486a98f68a0ec664960ac1c164&mode=xml";
String Canberra = "http://api.openweathermap.org/data/2.5/weather?q=Canberra&APPID=d4133a486a98f68a0ec664960ac1c164&mode=xml";

String locationAziziyaNode;
String locationWashingtonNode;
String locationHelsinkiNode;
String locationCanberraNode;

String locationAziziyaWeatherNode;
String locationWashingtonWeatherNode;
String locationHelsinkiWeatherNode;
String locationCanberraWeatherNode;

int temperatureInAziziya;
int temperatureInWashington;
int temperatureInHelsinki;
int temperatureInCanberra;

void setup() {
  size(640, 480);
  
  myClouds = new Scattered_Clouds();
  mySky = new ClearSky();
  myFewClouds = new Few_Cloud();
  myBrokenClouds = new Broken_Cloud();
  
  smooth();
  
  PFont generalFont = createFont("Ariel", 20, true); // Arial, 20 point, anti-aliasing on
  textFont(generalFont);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    exit();
    
  } 
  
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    cam = new Capture(this, cameras[0]);
    cam.start(); 
    
    String apiKey = getAPIKey();
    
    Aziziya = Aziziya.replace("APIKEY", apiKey);
    Washington = Washington.replace("APIKEY", apiKey);
    Helsinki = Helsinki.replace("APIKEY", apiKey);
    Canberra = Canberra.replace("APIKEY", apiKey);
    
    XML AziziyaxmlResponse = loadXML(Aziziya);
    XML WashingtonxmlResponse = loadXML(Washington);
    XML HelsinkixmlResponse = loadXML(Helsinki);
    XML CanberraxmlResponse = loadXML(Canberra);
    
    XML AziziyalocationNode = AziziyaxmlResponse.getChild("city");
    XML WashingtonlocationNode = WashingtonxmlResponse.getChild("city");
    XML HelsinkilocationNode = HelsinkixmlResponse.getChild("city");
    XML CanberralocationNode = CanberraxmlResponse.getChild("city");
    
    locationAziziyaNode = AziziyalocationNode.getString("name");
    locationWashingtonNode = WashingtonlocationNode.getString("name");
    locationHelsinkiNode = HelsinkilocationNode.getString("name");
    locationCanberraNode = CanberralocationNode.getString("name");
    
    XML temperatureAziziya = AziziyaxmlResponse.getChild("temperature");
    XML temperatureWashington = WashingtonxmlResponse.getChild("temperature");
    XML temperatureHelsinki = HelsinkixmlResponse.getChild("temperature");
    XML temperatureCanberra = CanberraxmlResponse.getChild("temperature");
    
    temperatureInAziziya = (int)(temperatureAziziya.getFloat("value")-273.15);
    temperatureInWashington = (int)(temperatureWashington.getFloat("value")-273.15);
    temperatureInHelsinki = (int)(temperatureHelsinki.getFloat("value")-273.15);
    temperatureInCanberra = (int)(temperatureCanberra.getFloat("value")-273.15);
    
    XML AziziyaWeather = AziziyaxmlResponse.getChild("weather");
    XML WashingtonWeather = WashingtonxmlResponse.getChild("weather");
    XML HelsinkiWeather = HelsinkixmlResponse.getChild("weather");
    XML CanberraWeather = CanberraxmlResponse.getChild("weather");
    
    locationAziziyaWeatherNode = AziziyaWeather.getString("value");
    locationWashingtonWeatherNode = WashingtonWeather.getString("value");
    locationHelsinkiWeatherNode = HelsinkiWeather.getString("value");
    locationCanberraWeatherNode = CanberraWeather.getString("value");
    
    colorMode(RGB, 100);
    
  }      
}

void draw() {
  
  if (cam.available() == true) {
    cam.read();
  }
  
  image(cam, 0, 0);
  
  if ((keyPressed == true) && (keyCode == UP)) {
    
    myClouds.Clouds();
    
    color c = color(255, 0, 0);
    fill(c);
    textAlign(CENTER);
    text("Weather in: " + locationCanberraNode, width/2, 20);
    
    textAlign(CENTER);
    text("Weather description: " + locationCanberraWeatherNode, width/2, 60);
       
    }
    
    if ((keyPressed == true) && (keyCode == DOWN)) {
      
    mySky.ClearSkys();
    
    color c = color(255, 0, 0);
    fill(c);
    textAlign(CENTER);
    text("Weather in: " + locationWashingtonNode, width/2, 20);
    
    textAlign(CENTER);
    text("Weather description: " + locationWashingtonWeatherNode, width/2, 60);
       
    }
    
    if ((keyPressed == true) && (keyCode == LEFT)) {
      
      myFewClouds.FewClouds();
    
      textAlign(CENTER);
      text("Weather in: " + locationHelsinkiNode, width/2, 20);
    
      textAlign(CENTER);
      text("Weather description: " + locationHelsinkiWeatherNode, width/2, 60);
       
    }
    
    if ((keyPressed == true) && (keyCode == RIGHT)) {
      
      myBrokenClouds.BrokenCloud();
    
      textAlign(CENTER);
      text("Weather in: " + locationAziziyaNode, width/2, 20);
    
      textAlign(CENTER);
      text("Weather description: " + locationAziziyaWeatherNode, width/2, 60);
       
    }
}

String getAPIKey()
{
  String theKey = null;
  
  XML xml = loadXML("apikeys.xml");
  
  XML[] allKeys = xml.getChildren("key");
  
  for (int i=0; i<allKeys.length; i++)
    {
      if (allKeys[i].getString("provider").equals("openweathermap.org"))
      {        
        // Bingo, found the one I'm looking for. Set the APIKEY 
        theKey = allKeys[i].getString("key");
        
        // break out of the for loop, we have found what we are looking for
        break;
      }
    }
  
  return theKey;
}