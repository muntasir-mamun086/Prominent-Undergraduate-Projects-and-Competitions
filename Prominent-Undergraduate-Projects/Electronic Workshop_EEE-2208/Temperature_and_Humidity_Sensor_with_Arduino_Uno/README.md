# Temperature and Humidity Monitoring with Arduino Uno

This project measures temperature and relative humidity using a **DHT11 sensor** and displays the readings on a **16×2 I2C LCD**. The Arduino also sends the readings to the Serial Monitor.

## Hardware Required

- Arduino Uno
- DHT11 temperature and humidity sensor
- 16×2 LCD with I2C backpack (address: `0x27`)
- Jumper wires
- USB cable for programming and power

## Wiring Connections

### DHT11 to Arduino Uno

| DHT11 pin | Arduino Uno pin |
|---|---|
| VCC | 5V |
| DATA | A3 |
| NC | Not connected |
| GND | GND |

> These pin names apply to the four-pin DHT11 module shown in the wiring diagram. Check the labels on your specific sensor.

### I2C LCD to Arduino Uno

| LCD pin | Arduino Uno pin |
|---|---|
| GND | GND |
| VCC | 5V |
| SDA | A4 |
| SCL | A5 |

All components must share a common GND.

## Required Arduino Libraries

Install these libraries using **Arduino IDE → Sketch → Include Library → Manage Libraries**:

- `DHT sensor library` by Adafruit
- `LiquidCrystal I2C` (a compatible library that supports `LiquidCrystal_I2C lcd(0x27, 16, 2);`)

`Wire` is included with the Arduino AVR board package and is normally available by default.

## How to Run

1. Connect the DHT11 sensor and I2C LCD according to the wiring tables.
2. Connect the Arduino Uno to your computer with USB.
3. Open the `.ino` sketch in Arduino IDE.
4. Select **Tools → Board → Arduino AVR Boards → Arduino Uno**.
5. Select the correct port under **Tools → Port**.
6. Verify and upload the sketch.
7. The LCD should display the temperature and humidity.
8. Open **Tools → Serial Monitor** and set the baud rate to **9600** to view readings.

## Display and Serial Output

The LCD is intended to show:

```text
Temp Monitoring
 T:25C  H:60%
```

The values above are examples; actual readings depend on the environment.

The Serial Monitor prints readings in this format:

```text
Humidity: 60 %, Temp: 25 C
```

If a sensor reading fails, the Serial Monitor prints:

```text
Sensor read failed!
```

## Sampling Interval

The sketch reads the sensor every **2 seconds** (`readInterval = 2000` milliseconds).

## Troubleshooting

- **LCD is blank:** Check 5V and GND, confirm the I2C address (`0x27`), and adjust the LCD backpack's contrast potentiometer.
- **LCD shows no useful readings:** Check the DHT11 wiring and make sure DATA is connected to `A3`, as configured by `#define DHTPIN A3`.
- **“Sensor read failed!” appears:** Check the sensor connections and power, then wait for the next sampling interval. If using a bare four-pin DHT11 sensor rather than a module, a pull-up resistor may be required between DATA and VCC.
- **Compilation fails:** Confirm that compatible versions of the DHT and LiquidCrystal I2C libraries are installed.
- **Readings are not updating:** Confirm the sketch uploaded successfully and check the Serial Monitor at 9600 baud.

## Notes About the Code

- `DHTPIN` is set to `A3`.
- `DHTTYPE` is set to `DHT11`.
- LCD I2C address is set to `0x27`.
- The code converts sensor readings to integers, so decimal precision is not displayed.
- The initial values are `-1`; before the first successful sensor reading, the LCD shows `--` for temperature and humidity.

## License

Add a license here if you plan to publish or redistribute this project. Otherwise, treat this file as project documentation only.
