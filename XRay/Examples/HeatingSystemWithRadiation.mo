within XRay.Examples;

model HeatingSystemWithRadiation
  Objects.Thermal.HeatSourceWithRadiation heatSource;
  Objects.Thermal.TungstenCathodeWithRadiation tungstenCathode;

equation
  connect(heatSource.powerOutput, tungstenCathode.heatingPower);
  connect(heatSource.radiatingSurfaceTemperatureOutput, tungstenCathode.radiatingSurfaceTemperature);
end HeatingSystemWithRadiation;
