within XRay.Objects.Thermal;

model HeatingSystemTungsten
  HeatSource heatSource;
  TungstenCathode tungstenCathode;

equation
  connect(heatSource.powerOutput, tungstenCathode.heatingPower);
end HeatingSystemTungsten;
