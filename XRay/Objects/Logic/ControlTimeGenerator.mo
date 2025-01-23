within XRay.Objects.Logic;

model ControlTimeGenerator
  // Inputs and outputs
  RealInput Temperature annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), 
              iconTransformation(origin = {0, 74}, extent = {{-16, -16}, {16, 16}}, rotation = -90)));
  BooleanOutput PID_Active annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), 
              iconTransformation(origin = {72, 0}, extent = {{-16, -16}, {16, 16}})));


  // Parameters
  parameter Modelica.Units.SI.Time highTime = 0.5 "Time for PID_Active to be true (seconds)";
  parameter Modelica.Units.SI.Time lowTime = 180 "Time for PID_Active to be false (seconds)";
  parameter Real tempThreshold = 2300 "Temperature threshold for activation (Celsius)";
  
  // Internal variables
  Boolean state(start = false) "Current state of PID_Active (true for active, false for inactive)";
  Modelica.Units.SI.Time timer(start = 0) "Timer to manage state transitions";
  Boolean tempCondition "Temperature threshold condition";

equation
  // Temperature threshold check
  tempCondition = Temperature > tempThreshold;

  // State transition logic using if-else
  if tempCondition and not state then
    state = true; // Set to true when temperature exceeds the threshold
    timer = 0; // Reset timer when state changes
  else
    if state then
      timer = time; // Track time in the high state
      if timer >= highTime then
        state = false; // Switch to false after highTime
      end if;
    else
      if not state then
        timer = time; // Track time in the low state
        if timer >= lowTime then
          state = true; // Ready for next cycle after lowTime
        end if;
      end if;
    end if;
  end if;

  // Output assignment, convert the state to Boolean directly
  PID_Active = state;

  annotation(
    Icon(graphics = {Ellipse(fillColor = {227, 227, 227}, fillPattern = FillPattern.Solid, lineThickness = 3.5, extent = {{-72, 71}, {72, -71}}), Line(origin = {0, 25}, rotation = 180, points = {{0, -25}, {0, 25}, {0, 25}}, thickness = 3.5, arrow = {Arrow.Filled, Arrow.None}), Line(origin = {23.4186, 0.447284}, rotation = 90, points = {{0, -13}, {0, 25}, {0, 25}}, thickness = 3.5, arrow = {Arrow.Filled, Arrow.None})}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));

end ControlTimeGenerator;
