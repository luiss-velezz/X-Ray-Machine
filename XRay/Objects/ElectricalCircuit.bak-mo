within XRay.Objects;

model ElectricalCircuit
  // Parameters
  parameter Modelica.Units.SI.Voltage V_supply = 50000  "Source voltage"; // (V)
  parameter Modelica.Units.SI.Resistance R_series = 10  "Series resistance"; // (Ohm)
  parameter Modelica.Units.SI.Capacitance C_parallel = 1e-6  "Parallel capacitance"; // (F)

  // Electrical connectors
  Connectors.ElectricalPin p "Positive terminal";
  Connectors.ElectricalPin n "Negative terminal";

  // Variables
  Modelica.Units.SI.Current I "Circuit current"; // (A)
  Modelica.Units.SI.Voltage V_applied "Voltage applied to the circuit"; // (V)
  Modelica.Units.SI.Voltage V_resistor "Voltage drop across the resistor"; // (V)
  Modelica.Units.SI.Voltage V_capacitor "Voltage across the capacitor"; // (V)
  Modelica.Units.SI.Charge Q "Electric charge stored in the capacitor"; // (C)

equation
  // Ohm's law for resistor
  V_resistor = I * R_series;

  // Voltage across the capacitor
  V_capacitor = Q / C_parallel;

  // Applied voltage balance equation
  V_applied = V_supply - (V_resistor + V_capacitor);

  // Charge stored in the capacitor
  Q = C_parallel * V_capacitor;

  // Current is the derivative of charge
  I = der(Q);

  // Connector equations
  //connect(p.v, V_applied); // Positive terminal voltage THIS LINE IS NOT WORKING
  //connect(n.v, 0);         // Negative terminal grounded   THIS LINE IS NOT WORKING
  p.i = I;                 // Positive terminal current
  n.i = -I;                // Negative terminal current
end ElectricalCircuit;

