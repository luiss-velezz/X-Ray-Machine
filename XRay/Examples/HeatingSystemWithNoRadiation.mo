within XRay.Examples;

model HeatingSystemWithNoRadiation
  Objects.Thermal.HeatSource heatSource;
  Objects.Thermal.TungstenCathode tungstenCathode;

equation
  connect(heatSource.powerOutput, tungstenCathode.heatingPower);
end HeatingSystemWithNoRadiation;
