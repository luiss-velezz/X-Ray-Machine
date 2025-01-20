within XRay.Ports;

partial connector ThermalPin "Thermal port for 1-dim. heat transfer"
  Modelica.Units.SI.Temperature T "Port temperature";
  flow Modelica.Units.SI.HeatFlowRate Q_flow
    "Heat flow rate (positive if flowing from outside into the component)";
  annotation (Documentation(info="<html>

</html>"));

end ThermalPin;