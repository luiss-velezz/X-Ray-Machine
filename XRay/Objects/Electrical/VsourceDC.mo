within XRay.Objects.Electrical;

model VsourceDC "DC voltage source"
  extends TwoTerminal;    // Extends the TwoTerminal model, inheriting its properties and equations
  parameter Modelica.Units.SI.Voltage Vdc = 220 "DC Voltage";    // Define a parameter Vdc representing the DC voltage
equation
  // DC voltage source equation: The voltage (v) across the source is constant and equals Vdc
  v = Vdc;
end VsourceDC;
