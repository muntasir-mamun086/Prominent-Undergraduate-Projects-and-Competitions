#include <DHT.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);
#define DHTPIN A3
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);
int h = -1;  
int t = -1;
unsigned long lastRead = 0;
const unsigned long readInterval = 2000;
void showLCD()
{
    lcd.setCursor(0, 0);
    lcd.print("Temp Monitoring ");
    lcd.setCursor(0, 1);
    lcd.print(" T:");
    if (t < 0) lcd.print("--");
    else       lcd.print(t);
    lcd.print("C  ");
    lcd.setCursor(10, 1);
    lcd.print("H:");
    if (h < 0) lcd.print("--");
    else       lcd.print(h);
    lcd.print("%  ");
}
void setup()
{
    Serial.begin(9600);
    lcd.init();
    lcd.backlight();
    showLCD();        
    dht.begin();
}
void loop()
{
    if (millis() - lastRead >= readInterval || lastRead == 0)
    {
        lastRead = millis();
        float hf = dht.readHumidity();
        float tf = dht.readTemperature();
        if (!isnan(hf) && !isnan(tf)) {
            h = (int)hf;
            t = (int)tf;
            Serial.print("Humidity: ");
            Serial.print(h);
            Serial.print(" %, Temp: ");
            Serial.print(t);
            Serial.println(" C");
        } else {
            Serial.println("Sensor read failed!");
        }
        showLCD();    
    }
}