within XRay.Objects.Beam;

model AnodeCalculator

  // Parameters
  parameter Modelica.Units.NonSI.Angle_deg theta_anode = 12  "Anode angle"; // (degrees)
  parameter Modelica.Units.SI.Area sigma = 1e-6  "Nominal impact area"; // (m²)
  parameter Modelica.Units.SI.Voltage HVS = 450000;

  // Variables
  Modelica.Units.SI.Power P_xray "X-ray power"; // (W)
  Modelica.Units.SI.Power P_heat "Heat power generated"; // (W)
  Modelica.Units.SI.Area A_impact "Impact area of the anode"; // (m²)

  //Ports
  Logic.RealInput InputPower annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Logic.RealOutput Radiation_xray annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
 
  //Constants
  constant Real atomicNumber_W = 74;
  
equation

  // Calculating impact area using anode angle
  A_impact = sigma * sin((theta_anode^Modelica.Constants.pi)/180);
  
  // X-ray power is a fraction of the anode power based on efficiency
  //P_xray = eta * InputPower;
  P_xray = (9e-10*atomicNumber_W*HVS)*InputPower;
  
  // Heat generated is the remaining power after X-ray production
  P_heat = InputPower - P_xray;
  
   //Output radiation emitted as XRays
  Radiation_xray = P_xray/A_impact;

end AnodeCalculator;
