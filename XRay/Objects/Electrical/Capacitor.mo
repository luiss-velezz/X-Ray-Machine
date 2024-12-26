within XRay.Objects.Electrical;

model Capacitor "Ideal Capacitor"
 extends Objects.TwoTerminal;           // Extends the TwoTerminal model, inheriting its properties and equations
 parameter Modelica.Units.SI.Capacitance C;  // Define a parameter C representing the capacitance in Farads
equation
 // Capacitor equation: The current (i) through the capacitor is proportional to the derivative
 // of the voltage (v) across the capacitor. The constant of proportionality is the capacitance (C)
 C*der(v) = i;
end Capacitor;