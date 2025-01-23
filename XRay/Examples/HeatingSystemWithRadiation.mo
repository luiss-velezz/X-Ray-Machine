within XRay.Examples;

model HeatingSystemWithRadiation
  Objects.Thermal.HeatSourceWithRadiation Q1(heatingPower= 80);//, ambientTemperature = 3000);
  Objects.Thermal.TungstenCathodeWithRadiation tungstenCathode;

equation
  connect(Q1.powerOutput, tungstenCathode.heatingPower);
  connect(Q1.radiatingSurfaceTemperatureOutput, tungstenCathode.radiatingSurfaceTemperature);
end HeatingSystemWithRadiation;
