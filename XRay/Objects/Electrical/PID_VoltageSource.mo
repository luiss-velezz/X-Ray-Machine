within XRay.Objects.Electrical;

model PID_VoltageSource
  "Controlled voltage source with a PID controller for temperature-based voltage output regulation"

  // Parameters for PID controller
  parameter Modelica.Units.SI.Temperature T_ref = 2300 "Setpoint temperature in Kelvin";
  parameter Real K_p = 1 "Proportional gain";
  parameter Real K_i = 0.1 "Integral gain";
  parameter Real K_d = 0.01 "Derivative gain";
  parameter Modelica.Units.SI.Voltage V_max = 20 "Maximum output voltage";

  // Internal variables
  Real error "Temperature error";
  Real integral "Integral term";
  Real derivative "Derivative term";
  Real controlSignal "Control signal output from PID controller";
  Modelica.Units.SI.Voltage sourceVoltage "Voltage provided by the source";

  // Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 port_a annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));

  equation 
    // Temperature error calculation
    error = T_ref - port_a.T;

    // Integral term (continuous integration of error)
    der(integral) = error;

    // Derivative term (rate of change of error)
    derivative = der(error);

    // Control signal calculation
    controlSignal = K_p * error + K_i * integral + K_d * derivative;

    // Limit the output voltage to the maximum allowed value
    sourceVoltage = if controlSignal > V_max then V_max else if controlSignal < 0 then 0 else controlSignal;

    // Electrical connections
    p.v = sourceVoltage;
    p.i + n.i = 0;

    port_a.Q_flow = 0;

    annotation (
        Diagram(
            graphics = {
                Rectangle(extent={{-100, 100}, {100, -100}}, lineColor={0, 0, 255}),
                Text(extent={{-50, 50}, {50, -50}}, textString="PID Voltage Source")
            }
        ),
        Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {200, 200, 200}, extent = {{-100, 100}, {100, -100}}), Text(extent = {{-50, 50}, {50, -50}}, textString = "PID_V"), Text(origin = {45, -46}, textColor = {0, 0, 255}, extent = {{-73, 24}, {73, -24}}, textString = "V=%sourceVoltage")}));
end PID_VoltageSource;
