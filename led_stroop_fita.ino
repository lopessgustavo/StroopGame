#include<ESP8266WiFi.h>
#include<PubSubClient.h>
#include<Adafruit_NeoPixel.h>

#define ssid "gustavo"
#define password "D562mJxX"
//#define BROKER_MQTT "m14.cloudmqtt.com"
//#define BROKER_PORT 10505
#define BROKER_MQTT "10.42.0.1"
#define BROKER_PORT 1883
//

#define PIN D1


WiFiClient espClient;
PubSubClient client(espClient);

// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:

Adafruit_NeoPixel strip = Adafruit_NeoPixel(60, PIN, NEO_GRB + NEO_KHZ800);


//função que conecta ao broker MQTT
void initMQTT(){
  client.setServer(BROKER_MQTT,BROKER_PORT);
  while(!client.connect("LED","sakhlfvx","3RKpMDJB89aL"));
  //while(!client.connect("LED"));
  Serial.println("MQTT conectado");
  client.setCallback(callback);
}

//função que conecta ao wifi
void initWiFi(){
  delay(10);
//  char ssid[] = "IC-RedeSemFio";
//  char password[] = "icuffsemfio";
  Serial.println("Tentando conenctar");
  WiFi.begin(ssid,password);
  while(WiFi.status() !=  WL_CONNECTED){
      delay(500);
      Serial.println(".");
  }
  Serial.println("WiFi conectado");
}

//função responsavel por ler as informações mandadas pelo broker mqtt
void callback(char* topic, byte* payload, unsigned int length){
  String message;
  for (int i = 0; i < length; i++) {
    char c = (char)payload[i];
    message += c;
  }
  //apagar();
  if(!message.equals("game_over"))acender(message);
  //else apagar();
}

void apagar(){
//  if(digitalRead(VERMELHO)) digitalWrite(VERMELHO,LOW);
//  else if(digitalRead(VERDE)) digitalWrite(VERDE,LOW);
//  else if(digitalRead(AMARELO)) digitalWrite(AMARELO,LOW);
//  else if(digitalRead(AZUL)) digitalWrite(AZUL,LOW);

}

void acender(String cor){
  if(cor.equals("VERMELHO")){
    colorWipe(strip.Color(255, 0, 0)); // Red;
    Serial.println(cor);
  }
  else if(cor.equals("VERDE")){
    colorWipe(strip.Color(0, 255, 0)); // Green
    Serial.println(cor);
  }
  else if(cor.equals("AMARELO")){
    colorWipe(strip.Color(255, 255, 0)); // Yellow
    Serial.println(cor);
  }
  else if(cor.equals("AZUL")){
    colorWipe(strip.Color(0, 0, 255)); // Blue
    Serial.println(cor);
  }
  else{
      int cod1 = cor.substring(0,2).toInt();
      int cod2 = cor.substring(4,7).toInt();
      int cod3 = cor.substring(9,11).toInt();
      colorWipe(strip.Color(cod1,cod2,cod3)); 
    }
}

void colorWipe(uint32_t c) {
  for(uint16_t i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
    strip.show();
  }
}

void setup() {
  
  strip.begin();
  strip.show(); // Initialize all pixels to 'off'
  Serial.begin(115200);
  initWiFi();
  initMQTT();
  client.subscribe("botao_apertado");
  
//  //setar os leds
//  pinMode(VERMELHO,OUTPUT);
//  pinMode(VERDE,OUTPUT);
//  pinMode(AMARELO,OUTPUT);
//  pinMode(AZUL,OUTPUT);

}

void loop() {
  
  client.loop();
}
