within XRay.Examples;

model HeatingSystemTungsten
  Objects.Thermal.HeatSource heatSource;
  Objects.Thermal.TungstenCathode tungstenCathode;

equation
  connect(heatSource.powerOutput, tungstenCathode.heatingPower);
end HeatingSystemTungsten;