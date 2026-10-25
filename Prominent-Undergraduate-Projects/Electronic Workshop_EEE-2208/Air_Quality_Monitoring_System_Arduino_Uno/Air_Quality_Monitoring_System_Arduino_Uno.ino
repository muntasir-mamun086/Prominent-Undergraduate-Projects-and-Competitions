#include <Wire.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);
const int smokeSensor = A0;
const int redLED = 7;
const int buzzer = 8;
const int smokeThreshold = 350;
void setup() {
  pinMode(redLED, OUTPUT);
  pinMode(buzzer, OUTPUT);
  digitalWrite(redLED, LOW);
  digitalWrite(buzzer, LOW);
  Serial.begin(9600);
  lcd.init();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print("Air Monitoring");
  delay(2000);
  lcd.clear();
}
void loop() {
  int smokeValue = analogRead(smokeSensor);
  Serial.println(smokeValue);
  lcd.setCursor(0, 0);
  lcd.print("Smoke: ");
  lcd.print(smokeValue);
  lcd.print("    ");
  if (smokeValue > smokeThreshold) {
    digitalWrite(redLED, HIGH);
    tone(buzzer, 2000);
    lcd.setCursor(0, 1);
    lcd.print("SMOKE DETECTED!");
  } else {
    digitalWrite(redLED, LOW);
    noTone(buzzer);
    lcd.setCursor(0, 1);
    lcd.print("Air Quality: OK ");
  }
  delay(200);
}
