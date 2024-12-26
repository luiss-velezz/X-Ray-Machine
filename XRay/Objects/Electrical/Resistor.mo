within XRay.Objects.Electrical;

model Resistor "Ideal resistor"
  extends Objects.TwoTerminal;     // Extends the TwoTerminal model, inheriting its properties and equations
  parameter Modelica.Units.SI.Resistance R;  // Define a parameter R representing the resistance in Ohms
equation
  // Ohm's Law: The voltage across the resistor (v) is equal to the product of the resistance (R)
  // and the current (i) through the resistor
  R*i = v;
end Resistor;