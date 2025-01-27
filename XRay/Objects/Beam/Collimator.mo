within XRay.Objects.Beam;

model Collimator

  //Parameters
  parameter Modelica.Units.SI.Length aperture(min = 0) = 0.01  "Aperture diameter"; // (m)

  //Ports
  Logic.RealInput AnodeRadiation annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-104, 0}, extent = {{-20, -20}, {20, 20}})));
  Logic.RealOutput RadiationDose annotation(
    Placement(transformation(origin = {-108, -26}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {99, 1}, extent = {{-23, -23}, {23, 23}})));
equation

    // Calculating output radiation intensity based on aperture area
  RadiationDose = AnodeRadiation / (Modelica.Constants.pi * (aperture / 2)^2);

end Collimator;
