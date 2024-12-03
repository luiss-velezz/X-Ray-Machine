within XRay.Connectors;

connector ThermalPin
  
  //Effort variable
  Modelica.Units.SI.Temperature T "Temperature"; // (K)
  
  //Flow variable
  flow Modelica.Units.SI.HeatFlowRate Q_dot "Heat Flow Rate"; // (W)

end ThermalPin;
