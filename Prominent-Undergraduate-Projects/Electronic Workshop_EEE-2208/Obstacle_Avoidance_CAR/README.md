# 🚗 Obstacle Avoiding Car

An Arduino-based autonomous obstacle-avoiding robot car built using an
**Arduino Uno, L298N motor driver, and HC-SR04 ultrasonic sensor**. The
car detects obstacles in front of it and automatically changes direction
to avoid collisions.

## 📌 Project Overview

This project uses an ultrasonic sensor to measure the distance between
the car and nearby objects.

### Working Principle

1.  The HC-SR04 ultrasonic sensor measures the distance.
2.  If no obstacle is detected within the predefined limit, the car
    moves forward.
3.  If an obstacle is detected:
    -   The car stops.
    -   Moves backward briefly.
    -   Turns right.
    -   Continues moving forward.

The obstacle detection threshold is set to **20 cm** in the Arduino
code.

## 🧰 Components Required

-   Arduino Uno
-   L298N Dual H-Bridge Motor Driver
-   HC-SR04 Ultrasonic Sensor
-   Two DC geared motors with wheels
-   Robot car chassis
-   Battery pack
-   Jumper wires
-   On/Off switch
-   Screws and mounting accessories

## 🔌 Pin Connection Table

### L298N Motor Driver to Arduino Uno

  L298N Pin     Arduino Pin Function
  ----------- ------------- ---------------------------
  ENA                    D5 Left motor speed control
  IN1                    D6 Left motor direction
  IN2                    D7 Left motor direction
  IN3                    D8 Right motor direction
  IN4                    D9 Right motor direction
  ENB                   D10 Right motor speed control
  GND                   GND Common ground

### HC-SR04 to Arduino Uno

  HC-SR04 Pin     Arduino Pin
  ------------- -------------
  VCC                      5V
  TRIG                    D11
  ECHO                    D12
  GND                     GND

> **Important:** Arduino GND, L298N GND, sensor GND, and the battery
> negative terminal must share a common ground.

## ⚡ Power Supply

-   The L298N motor supply should be connected to a suitable battery
    supply for the selected motors.
-   The Arduino and HC-SR04 should receive the correct regulated
    voltage.
-   Do not connect an unsuitable battery voltage directly to the Arduino
    5V pin.
-   Check the motor driver's voltage requirements and the battery
    voltage before powering the circuit.

> The physical prototype uses a battery pack. Confirm the actual battery
> voltage and polarity before connecting it to the motor driver.

## 🧠 Control Logic

``` text
Start
  |
Initialize motor and ultrasonic sensor pins
  |
Measure distance
  |
Is distance greater than 20 cm?
  |
  +---- Yes ----> Move Forward
  |
  +---- No -----> Stop
                   |
                   v
              Move Backward
                   |
                   v
                  Stop
                   |
                   v
               Turn Right
                   |
                   v
                  Stop
                   |
                   v
             Measure Again
```

## 💻 Software

### Required Software

-   Arduino IDE
-   Arduino Uno board package

### Upload Instructions

1.  Install and open the Arduino IDE.
2.  Open `Obstacle_Avoidance_CAR.ino`.
3.  Connect the Arduino Uno to your computer using a USB cable.
4.  Select:
    -   **Board:** Arduino Uno
    -   **Port:** The correct connected COM port
5.  Click **Verify** to compile the code.
6.  Click **Upload**.
7.  Disconnect USB if required and power the robot using the battery
    supply.
8.  Test the car in an open area.

## ⚙️ Main Code Parameters

  Parameter               Value Description
  --------------------- ------- --------------------------------
  `OBSTACLE_DISTANCE`     20 cm Obstacle detection threshold
  `ENA`                      D5 Left motor PWM control
  `ENB`                     D10 Right motor PWM control
  `TRIG_PIN`                D11 Ultrasonic trigger
  `ECHO_PIN`                D12 Ultrasonic echo
  Motor PWM                 255 Maximum configured motor speed

## 🛠️ Features

-   Automatic obstacle detection
-   Autonomous forward movement
-   Reverse movement when an obstacle is detected
-   Automatic right-turn maneuver
-   Simple and beginner-friendly Arduino code
-   L298N-based dual DC motor control

## 📷 Project Photos

Add the project images to the repository using the following filenames:

``` text
images/
├── robot_top_view.jpg
├── robot_side_view.jpg
├── robot_front_view.jpg
└── connection_diagram.jpg
```

Then display them in this README:

### Top View

![Robot top view](images/robot_top_view.jpg)

### Side View

![Robot side view](images/robot_side_view.jpg)

### Front View

![Robot front view](images/robot_front_view.jpg)

### Connection Diagram

![Connection diagram](images/connection_diagram.jpg)

## ⚠️ Safety and Testing Notes

-   Test the robot on a flat and open surface.
-   Keep fingers away from rotating wheels.
-   Check all wiring before turning on the power.
-   Ensure the ultrasonic sensor is firmly mounted.
-   If the car moves in the opposite direction, swap the motor wires or
    adjust the motor direction logic in the code.
-   The current program turns right whenever an obstacle is detected. It
    does not compare left and right distances.

## 🔮 Possible Future Improvements

-   Add servo-based ultrasonic sensor scanning.
-   Measure both left and right distances before turning.
-   Add PWM speed adjustment for smoother movement.
-   Add Bluetooth or Wi-Fi control.
-   Add battery voltage monitoring.
-   Improve obstacle avoidance using a decision-based algorithm.

## 📁 Repository Structure

``` text
Obstacle-Avoiding-Car/
├── Obstacle_Avoidance_CAR.ino
├── README.md
└── images/
    ├── robot_top_view.jpg
    ├── robot_side_view.jpg
    ├── robot_front_view.jpg
    └── connection_diagram.jpg
```

## 👨‍💻 Author

**Muntasir Mamun**

## 📄 License

This project is intended for educational, experimental, and personal
robotics projects. You may modify and improve the code for your own use.
