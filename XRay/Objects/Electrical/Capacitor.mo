within XRay.Objects.Electrical;

model Capacitor "Ideal Capacitor"
 extends Objects.TwoTerminal;           // Extends the TwoTerminal model, inheriting its properties and equations
 parameter Modelica.Units.SI.Capacitance C(min=0);  // Define a parameter C representing the capacitance in Farads 
equation
 // Capacitor equation: 
 C*der(v) = i;
 // Add assertion to check for positive resistance 
 assert(C >= 0, "Capacitance should be non-negative and a Real number");
end Capacitor;