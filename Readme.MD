# Lorenz Attractor — Butterfly Effect

A MATLAB/Simulink project exploring the **Lorenz system**, deterministic chaos, and the famous **butterfly effect**.

The project models the Lorenz differential equations in **Simulink from scratch** and visualizes how a simple set of nonlinear differential equations can produce highly complex and sensitive behavior.

## Overview

While studying **Nonlinear Systems**, I came across a demonstration of the Lorenz attractor and the butterfly effect. This led me to explore the underlying mathematics and implement the system myself using MATLAB and Simulink.

One of the interesting parts of the project was that a small implementation error initially prevented the model from producing the expected butterfly-shaped attractor. After verifying the equations, parameters, and Simulink implementation, the error was identified and corrected.

The final model successfully reproduces the characteristic **Lorenz butterfly attractor**.

## The Lorenz System

The Lorenz system is described by three coupled nonlinear differential equations:

$$
\begin{aligned}
\frac{dx}{dt} &= \sigma(y-x) \\
\frac{dy}{dt} &= x(\rho-z)-y \\
\frac{dz}{dt} &= xy-\beta z
\end{aligned}
$$

For this project, the classical Lorenz parameters are used:

| Parameter | Value |
|---|---:|
| $\sigma$ | 10 |
| $\rho$ | 28 |
| $\beta$ | $\frac{8}{3}$ |

With these parameters, the system exhibits chaotic behavior and produces the characteristic butterfly-shaped attractor.

## What This Project Demonstrates

- Modeling nonlinear differential equations in **Simulink**
- Translating mathematical equations into block-diagram implementations
- Simulation of a nonlinear dynamical system
- Visualization of chaotic trajectories
- Sensitivity of nonlinear systems to implementation and initial conditions
- Connecting mathematical models with their computational implementation

## Simulink Model

The Lorenz equations are implemented using basic Simulink blocks representing the individual mathematical operations, integrators, feedback paths, and nonlinear terms.

The three state variables are:

- $x(t)$
- $y(t)$
- $z(t)$

The outputs of the integrators are fed back through the corresponding nonlinear relationships to form the complete dynamical system.

## Results

The simulation produces the characteristic **Lorenz butterfly attractor** when the classical parameter values are used.

### Lorenz Attractor

![Lorenz Attractor](Sample%20Outputs/Lorentz_Attractor_Butterfly_Effect.png)

### Simulink Block Diagram

![Simulink Block Diagram](Sample%20Outputs/Simulink_Block_Diagram.png)

### Simulation Output

![Simulink Output](Sample%20Outputs/Simulink_output_1.png)

Additional simulation results are available in the [`Sample Outputs`](Sample%20Outputs) directory.

## Repository Structure

```text
Lorenz-Attractor-Butterfly-Effect/
│
├── Sample Outputs/
│   ├── Lorentz_Attractor_Butterfly_Effect.png
│   ├── Simulink_Block_Diagram.png
│   ├── Simulink_output_1.png
│   └── Simulink_outputs.png
│
├── slprj/
│
├── automate.m
│
└── README.md