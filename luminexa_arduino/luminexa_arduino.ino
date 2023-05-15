#include <Arduino.h>

#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>

#include <ESP8266HTTPClient.h>

#include <WiFiClientSecureBearSSL.h>

#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>
const int ECHOPIN = 4; //D2
const int TRIGPIN = 5; //D1
int temp_value=0;
int distance = 0;
int sec = 1000;
int interv = 1800;
int base_interv=0;
const int ledPin = 2; 


String END_POINT = "http://localhost:8000/history/instance";

ESP8266WiFiMulti WiFiMulti;

void setup() {

  Serial.begin(9600);
  // Serial.setDebugOutput(true);

  Serial.println();
  Serial.println();
  Serial.println();

  for (uint8_t t = 5; t > 0; t--) {
    Serial.printf("[SETUP] WAIT ARDUINO %d...\n", t);
    Serial.flush();
    delay(1000);
  }

  WiFiManager wifiManager;
Serial.println("Conecting.....");
wifiManager.autoConnect("Luminexa","12345678");
Serial.println("connected");


  pinMode(ECHOPIN, INPUT);
  pinMode(TRIGPIN, OUTPUT);
  
}

void loop() {
  // wait for WiFi connection
  if ((WiFiMulti.run() == WL_CONNECTED)) {

    std::unique_ptr<BearSSL::WiFiClientSecure>client(new BearSSL::WiFiClientSecure);

    //client->setFingerprint(fingerprint);
    client->setInsecure();

    HTTPClient https;



    base_interv++;


  }



 // increase the LED brightness
  for(int dutyCycle = 0; dutyCycle < 255; dutyCycle++){   
    // changing the LED brightness with PWM
    analogWrite(ledPin, dutyCycle);
    delay(1);
  }

  // decrease the LED brightness
  for(int dutyCycle = 255; dutyCycle > 0; dutyCycle--){
    // changing the LED brightness with PWM
    analogWrite(ledPin, dutyCycle);
    delay(1);
  }  


  Serial.println("Wait 2s before next round...");
  delay(2*sec);
}


