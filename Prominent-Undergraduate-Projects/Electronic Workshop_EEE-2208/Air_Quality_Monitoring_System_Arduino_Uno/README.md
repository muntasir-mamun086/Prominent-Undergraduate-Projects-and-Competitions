# Air Quality Monitoring System using Arduino Uno

An Arduino-based air quality monitoring project that uses an MQ-2 gas/smoke sensor to detect elevated smoke/gas readings. The system displays the sensor value on a 16×2 I2C LCD and activates a red LED and a passive/coil buzzer when the reading exceeds a configured threshold.

## Features

- Reads the MQ-2 sensor's analog output.
- Displays the sensor reading on a 16×2 I2C LCD.
- Turns on one red LED when the reading exceeds the threshold.
- Sounds a passive/coil buzzer using a 2000 Hz tone.
- Displays `SMOKE DETECTED!` during an alert.
- Displays `Air Quality: OK` when the reading is at or below the threshold.
- Prints sensor readings to the Arduino Serial Monitor.

## Components Required

- Arduino Uno
- MQ-2 gas/smoke sensor module with analog output (`AO`)
- 16×2 LCD with I2C interface
- 1 red LED
- 220 Ω resistor for the red LED
- Passive/coil buzzer
- Breadboard and jumper wires
- USB cable and suitable power supply

## Wiring Connections

| Component pin | Arduino Uno pin | Notes |
|---|---|---|
| MQ-2 VCC | 5V | Sensor power |
| MQ-2 GND | GND | Common ground |
| MQ-2 AO | A0 | Analog sensor output |
| Red LED anode (+) | D7 through 220 Ω resistor | LED current limiting |
| Red LED cathode (−) | GND | Ground |
| Passive buzzer signal (+) | D8, through a suitable driver if required | Tone output |
| Buzzer return (−) | GND / driver return | Follow buzzer specifications |
| LCD VCC | 5V | LCD power |
| LCD GND | GND | Common ground |
| LCD SDA | A4 | I2C data |
| LCD SCL | A5 | I2C clock |

**Important:** Connect the MQ-2 module's **AO** pin to A0, not its digital output (`DO`). If the buzzer requires more current than an Arduino pin can safely supply, use a suitable transistor driver and follow the buzzer's voltage/current ratings.

## Software Requirements

1. Install the Arduino IDE.
2. In **Tools → Manage Libraries**, install a compatible `LiquidCrystal_I2C` library.
3. Connect the Arduino Uno to the computer using USB.
4. Select **Tools → Board → Arduino Uno** and the correct port.
5. Upload the sketch.

The sketch uses LCD I2C address `0x27`. If the LCD backlight works but no text appears, check the module's I2C address; some modules use `0x3F`.

## How It Works

1. The Arduino reads the MQ-2 analog value from pin A0 (typically in the range 0–1023).
2. The current reading is printed to the Serial Monitor at **9600 baud**.
3. The reading is displayed on the LCD.
4. If `smokeValue > smokeThreshold`:
   - The red LED turns on.
   - The buzzer generates a 2000 Hz tone.
   - The LCD displays `SMOKE DETECTED!`.
5. Otherwise:
   - The red LED turns off.
   - The buzzer stops.
   - The LCD displays `Air Quality: OK`.

## Threshold Configuration

The current sketch sets:

```cpp
const int smokeThreshold = 350;
```

This is only a starting value, not a universal smoke threshold. Open **Tools → Serial Monitor**, set the baud rate to **9600**, and compare readings in normal air with readings during a safe, controlled sensor test. Adjust the threshold to suit the sensor/module and environment.

## MQ-2 Warm-Up and Safety

- Allow the MQ-2 sensor to warm up according to its datasheet; a short startup delay does not guarantee that the sensor is fully warmed up or calibrated.
- Avoid testing with an open flame. Use safe, controlled testing practices.
- The raw analog value is **not a calibrated ppm measurement**.
- This hobby project is not a substitute for a certified smoke alarm, gas detector, or life-safety system.

## Troubleshooting

### LCD is blank or text is missing
- Check 5V, GND, SDA (A4), and SCL (A5).
- Confirm the I2C address (`0x27` or, on some modules, `0x3F`).
- Confirm that a compatible `LiquidCrystal_I2C` library is installed.

### Smoke is not detected
- Verify MQ-2 `AO → A0`, VCC → 5V, and GND → GND.
- Open the Serial Monitor at 9600 baud and observe the raw reading.
- Confirm that the reading changes during a safe sensor test.
- Adjust `smokeThreshold` based on observed readings.

### Red LED does not light
- Check LED polarity.
- Confirm the LED is connected to D7 through a 220 Ω resistor.
- Ensure the LED cathode is connected to GND.

### Buzzer does not sound
- Confirm the buzzer is suitable for the circuit and check its polarity/specifications.
- The sketch uses `tone(8, 2000)`, which is appropriate for many passive/coil buzzers.
- If the buzzer needs more current, use a suitable transistor driver rather than powering it directly from the Arduino pin.

## Code

The Arduino sketch for this README is the code supplied for this project:

```cpp
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
```

## License

Add a license if you plan to publish or distribute this project. If no license is specified, others should not assume that the code is open for reuse.
