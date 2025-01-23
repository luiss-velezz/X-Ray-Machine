within XRay.Objects.Electrical;

model VsourceWindow "Voltage source with active time window"
  extends Ports.TwoTerminal;    // Extends the TwoTerminal model, inheriting its properties and equations

  parameter Modelica.Units.SI.Voltage Vdc "Voltage";      // Define a parameter V representing the voltage
  parameter Modelica.Units.SI.Voltage V_offset "Voltage";      // Define a parameter V representing the voltage
  parameter Modelica.Units.SI.Time t_Start(min=0)"Start time";  // Define a parameter t_Start for the start time
  parameter Modelica.Units.SI.Time t_End(min=0) "End time";
  // Define a parameter t_End for the end time
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {92, -2}, extent = {{-10, -10}, {10, 10}})));
equation
  // Conditional voltage equation: The voltage (v) is V between t_Start and t_End, otherwise it is 0
  v = if (time >= t_Start and time <= t_End) then Vdc else V_offset;
  //Assert that the values are realistic
  assert(t_Start >= 0 and t_End >= 0, "The start time and end time should be positive values");
  assert(t_Start < t_End, "The end time should be larger than the start time");
annotation(
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end VsourceWindow;
