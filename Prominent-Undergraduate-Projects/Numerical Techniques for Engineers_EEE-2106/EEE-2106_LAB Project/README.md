# Circuit Analysis Using Newton-Raphson Method

A MATLAB-based project for analyzing a nonlinear diode circuit using the Newton-Raphson numerical method.

## Overview

This project uses the Newton-Raphson method to calculate the operating voltage and current of a silicon diode connected in series with a resistor and a DC voltage source.

The program solves the nonlinear circuit equation derived from Kirchhoff's Voltage Law (KVL) and the Shockley diode equation. It also displays the iteration results and plots the numerical convergence.

## Objectives

- Analyze a nonlinear diode-resistor circuit.
- Apply Kirchhoff's Voltage Law to derive the circuit equation.
- Implement the Newton-Raphson numerical method in MATLAB.
- Calculate diode voltage, current, and power.
- Evaluate convergence using an error tolerance.
- Visualize the convergence of the numerical solution.

## Circuit configuration

The circuit consists of a 5 V DC voltage source, a 1 kΩ resistor, and a silicon diode connected in series.

### Circuit parameters

| Parameter | Symbol | Value |
|---|---|---:|
| Source voltage | Vs | 5 V |
| Series resistance | R | 1 kΩ |
| Reverse saturation current | Is | 1 × 10⁻¹² A |
| Ideality factor | n | 1 |
| Thermal voltage | Vt | 25.85 mV |
| Initial diode voltage | Vd₀ | 0.7 V |
| Convergence tolerance | ε | 1 × 10⁻⁶ |

## Mathematical formulation

### 1. Kirchhoff's Voltage Law

Applying KVL to the series circuit:

Vs = VR + Vd

Using Ohm's law:

Id = (Vs − Vd) / R

### 2. Shockley diode equation

The diode current is expressed as:

Id = Is × (exp(Vd / (nVt)) − 1)

Combining the two equations gives the nonlinear function:

f(Vd) = (Vs − Vd) / R − Is × (exp(Vd / (nVt)) − 1)

The objective is to find the diode voltage for which f(Vd) = 0.

### 3. Newton-Raphson method

The iterative formula is:

Vd(k+1) = Vd(k) − f(Vd(k)) / f'(Vd(k))

The iteration continues until the absolute difference between two successive voltage estimates is smaller than the specified tolerance.

## Methodology

The MATLAB program follows these steps:

1. Define the circuit parameters.
2. Set the initial voltage estimate and solver settings.
3. Formulate the nonlinear circuit equation.
4. Calculate the first derivative.
5. Apply the Newton-Raphson iteration.
6. Check the convergence status.
7. Calculate the final circuit quantities.
8. Display the numerical results.
9. Plot the convergence error.
10. Plot the diode voltage at each iteration.

## Requirements

- MATLAB R2023b or a compatible MATLAB version.
- No additional toolboxes are required.

## How to run

1. Clone or download this repository.
2. Open MATLAB.
3. Navigate to the project folder.
4. Open `newton_raphson_circuit_analysis.m`.
5. Run the script.

The iteration table, final circuit results, and convergence plots will appear in MATLAB.

## Expected results

The solution is expected to be approximately:

| Quantity | Expected value |
|---|---:|
| Diode voltage | 0.717 V |
| Diode current | 4.283 mA |
| Resistor voltage | 4.283 V |
| Diode power | 3.07 mW |

Actual displayed values may differ slightly because of numerical precision.

## Output visualizations

The program generates two plots:

- **Newton-Raphson convergence error:** Shows how the error changes during successive iterations.
- **Diode voltage convergence:** Shows how the estimated diode voltage approaches the numerical solution.

## Applications

This project demonstrates how numerical methods can be applied to nonlinear electrical circuit analysis. The same general approach can be extended to diode networks, nonlinear circuit equations, and other engineering problems.

## Limitations

- The diode is modeled using the Shockley equation.
- The thermal voltage and ideality factor are assumed constant.
- Parasitic resistance, temperature variation, and other non-ideal diode effects are not included.

## Author

**Your Name**

Electrical and Electronic Engineering Student

GitHub: [Your GitHub Profile URL]

## License

This project can be distributed under the MIT License if you choose to use that license. Include an MIT `LICENSE` file in the repository before describing the project as MIT-licensed.
