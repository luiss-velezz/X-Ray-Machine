within XRay.Objects.Thermal;

model ThermalCapacitor
  //Parameters
  parameter Modelica.Units.SI.Mass mass(min = 0) = 0.01; // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat(min = 0) = 132; // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Area surfaceArea(min = 0) = 1e-6;   // m^2
  //Variables
  Modelica.Units.SI.Temperature T(start = 293.15, displayUnit = "degC") "Temperature of element";
  Modelica.Units.SI.TemperatureSlope der_T(start = 0) "Time derivative of temperature (= der(T))";
  //Ports
  Ports.ThermalPin_1 port annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  T = port.T;
  der_T = der(T);
  mass*specificHeat*der(T) = port.Q_flow;
  assert(mass > 0 , "Mass should be greater than zero kg");
  
initial equation
  port.T = 300.15;
  
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 110}, {150, 70}}, textString = "%name"), Polygon(fillColor = {192, 191, 188}, fillPattern = FillPattern.Solid, points = {{10, 55}, {-14, 57}, {-22, 45}, {-52, 43}, {-58, 35}, {-68, 25}, {-72, 13}, {-68, -1}, {-78, -15}, {-86, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-48, -63}, {-48, -77}, {-30, -83}, {-10, -73}, {-2, -85}, {8, -89}, {22, -75}, {32, -87}, {42, -81}, {44, -67}, {56, -73}, {62, -57}, {68, -53}, {64, -33}, {72, -35}, {68, -11}, {78, -13}, {66, 7}, {74, 15}, {66, 25}, {60, 39}, {44, 41}, {42, 53}, {26, 65}, {10, 55}}), Text(extent = {{-69, 7}, {71, -24}}, textString = "m=%mass
cp=%specificHeat")}),
    Documentation(info = "<html><head></head><body><p style=\"color: rgb(0, 0, 0); font-family: -webkit-standard; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;\"><span style=\"font-family: 'MS Shell Dlg 2'; font-size: medium;\">\"Model representing the heat capacity and thermal behavior of a material\"&nbsp;</span></p><div class=\"htmlDoc\" style=\"font-family: 'MS Shell Dlg 2'; font-size: medium; color: rgb(0, 0, 0); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;\"><p>This model simulates the heat storage and temperature change of a material by considering its mass, specific heat capacity, and surface area. It assumes uniform temperature throughout the material.</p></div><p><br></p>
</body></html>"));
end ThermalCapacitor;
