within XRay.Objects.Beam;

model Anode
  // Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
  
  // Parameters
  parameter Modelica.Units.SI.Length d = 1e-3 "Distance between anode and cathode in meters";
  parameter Modelica.Units.SI.Voltage V=50000 "Voltage between anode and cathode";
  
  // Variables
  Modelica.Units.SI.CurrentDensity J "Current density";
  Modelica.Units.SI.Current I "Current";
  
  // Constants
  constant Modelica.Units.SI.Permittivity epsilon_0 = Modelica.Constants.epsilon_0 "Permittivity of free space";
  constant Modelica.Units.SI.Charge e = Modelica.Constants.q "Electron charge";
  constant Modelica.Units.SI.Mass m = 9.1093837139e-31 "Electron mass"; // (kg)
  parameter Modelica.Units.SI.Area A = 1e-6 "Area of the anode in m^2";
  
equation
  // Child-Langmuir equation for current density
  p.i/A = (4 * epsilon_0 / 9) * sqrt(2 * e / m) * (V^(3/2)) / (d^2);
  
  // Total current
  //p.i = J * A;
  
  // Connect the current to the ports
  //p.i = I;
  n.i = -p.i;
  
  // Voltage across the anode and cathode
  V = p.v - n.v;

end Anode;
