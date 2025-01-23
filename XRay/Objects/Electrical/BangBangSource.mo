within XRay.Objects.Electrical;

model BangBangSource
  "Controlled voltage source with a Bang Bang controller for temperature-based voltage output regulation"
  
  //Parameters
  parameter Modelica.Units.SI.Voltage V_max = 20 "Maximum voltage output";
  parameter Modelica.Units.SI.Voltage V_min = 0 "Minimum voltage output";
  //parameter Modelica.Units.SI.Temperature T_setpoint = 2300 "Setpoint temperature";
  parameter Modelica.Units.SI.Temperature T_upper_setpoint = 2305 "Upper Setpoint Temperature";
  parameter Modelica.Units.SI.Temperature T_lower_setpoint = 2295 "Lower Setpoint Temperature";
  
  //parameter Modelica.Units.SI.Temperature hysteresis = 5 "Hysteresis range in Kelvin";
  
  // Variables
  Modelica.Units.SI.Voltage V_output "Controlled output voltage";
  Modelica.Units.SI.Temperature T_input "Measured Temperature of Cathode";
  Boolean heating = true "State of the controller (true if heating, false if cooling)";
 
  // Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {-2, -104}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
  Ports.ThermalPin_1 port_a annotation( 
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));  
  
  equation 
    
    T_input = port_a.T;
    
    if T_input >= T_upper_setpoint then
      V_output = V_min;
    end if;
    if T_input <= T_lower_setpoint then
      V_output = V_max;
    end if;

    //V_output = 3*T_input;
    //V_output = if heating then V_max else V_min;

    port_a.Q_flow = 0; // We force zero heat transfer

    // Electrical connections
    p.v = V_output;
    p.i + n.i = 0;

    annotation (
        Diagram(
            graphics={
                Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
                Text(extent={{-150,150},{150,100}}, textString="Controlled Voltage Source")
            }
        ),
        Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {200, 200, 200}, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -124},extent = {{-150, 150}, {150, 100}}, textString = "V"), Line(points = {{-80, -40}, {-40, -40}, {-40, 40}, {40, 40}, {40, -40}, {80, -40}, {80, -40}}, thickness = 1.25)}),
 experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end BangBangSource;
