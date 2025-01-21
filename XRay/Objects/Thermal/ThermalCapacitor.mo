within XRay.Objects.Thermal;

model ThermalCapacitor
  //parameter Modelica.Units.SI.HeatCapacity C "Heat capacity of element (= cp*m)";
  parameter Modelica.Units.SI.Mass mass(min = 0) = 0.01;
  // kg
  parameter Modelica.Units.SI.SpecificHeatCapacity specificHeat(min = 0) = 132;
  // J/(kg*K) for tungsten
  parameter Modelica.Units.SI.Area surfaceArea(min = 0) = 1e-6;
  // m^2
  Modelica.Units.SI.Temperature T(start = 293.15, displayUnit = "degC") "Temperature of element";
  Modelica.Units.SI.TemperatureSlope der_T(start = 0) "Time derivative of temperature (= der(T))";
  Ports.ThermalPin_1 port annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  T = port.T;
  der_T = der(T);
  mass*specificHeat*der(T) = port.Q_flow;
  assert(mass > 0 , "Mass should be greater than zero kg");
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 110}, {150, 70}}, textString = "%name"), Polygon(fillColor = {192, 191, 188}, fillPattern = FillPattern.Solid, points = {{0, 67}, {-20, 63}, {-40, 57}, {-52, 43}, {-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {56, -73}, {66, -61}, {68, -53}, {70, -51}, {72, -35}, {76, -21}, {78, -13}, {78, 3}, {74, 15}, {66, 25}, {54, 33}, {44, 41}, {36, 57}, {26, 65}, {0, 67}}), Polygon(fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {42, -77}, {40, -77}, {30, -79}, {20, -81}, {18, -81}, {10, -81}, {2, -77}, {-12, -73}, {-22, -73}, {-30, -71}, {-40, -65}, {-50, -55}, {-56, -43}, {-58, -35}, {-58, -25}, {-60, -13}, {-60, -5}, {-60, 7}, {-58, 17}, {-56, 19}, {-52, 27}, {-48, 35}, {-44, 45}, {-40, 57}, {-58, 35}}), Text(extent = {{-69, 7}, {71, -24}}, textString = "m=%mass
cp=%specificHeat")}),
    Documentation(info = "<html><head></head><body><p>
This is a generic model for the heat capacity of a material.
No specific geometry is assumed beyond a total volume with
uniform temperature for the entire volume.
Furthermore, it is assumed that the heat capacity
is constant (independent of temperature).</p><p>The parameters</p><p><br></p>
</body></html>"));
end ThermalCapacitor;