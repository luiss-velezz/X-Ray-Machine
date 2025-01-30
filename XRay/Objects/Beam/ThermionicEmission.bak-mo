within XRay.Objects.Beam;

model ThermionicEmission

  // Parameters for Richardson's law
  parameter Real phi = 4.5 "Work function of tungsten (eV)";
  parameter Modelica.Units.SI.Area Area = 1e-6; // Area of the cathode in m^2
  //Constant missing of electron mass:
  constant Modelica.Units.SI.Mass m_e = 9.1093837139e-31 "Electron mass"; // (kg)
  // Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 port_a annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}})));
equation

  port_a.Q_flow = 0; // No heat flow

  // Richardson's law equation
  p.i = ((4*Modelica.Constants.pi*Modelica.Constants.q*m_e*Modelica.Constants.k^2)/(Modelica.Constants.h^3) * port_a.T^2 * exp(-phi*Modelica.Constants.q / (Modelica.Constants.k * port_a.T)))*Area;



end ThermionicEmission;
