within XRay.Connectors;

connector ElectricalPin

  // Effort variable
  Modelica.Units.SI.Voltage v "Electrical potential (V)";
  
  // Flow variable
  flow Modelica.Units.SI.Current i "Electrical current (A)";

end ElectricalPin;
