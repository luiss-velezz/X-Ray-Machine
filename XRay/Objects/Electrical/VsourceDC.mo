within XRay.Objects.Electrical;

model VsourceDC "DC voltage source"
  //extends Objects.TwoTerminal;    // Extends the TwoTerminal model, inheriting its properties and equations
  
  Modelica.Units.SI.Voltage v "Voltage drop of the two pins (= p.v - n.v)";
  Modelica.Units.SI.Current i "Current flowing from pin p to pin n";  
  
  Ports.PositivePin p "Positive electrical pin"
    annotation (Placement(transformation(extent = {{-110, -10}, {-90, 10}}), iconTransformation(origin = {100, 98}, extent = {{-110, -10}, {-90, 10}})));
  Ports.NegativePin n "Negative electrical pin"
    annotation (Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(origin = {-100, -98}, extent = {{90, -10}, {110, 10}})));

  
  parameter Modelica.Units.SI.Voltage Vdc "DC Voltage";    // Define a parameter Vdc representing the DC voltage
equation
  // DC voltage source equation: The voltage (v) across the source is constant and equals Vdc
  
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  
  v = Vdc;
end VsourceDC;
