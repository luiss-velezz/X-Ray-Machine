within XRay.Objects.Logic;

model ControlTimeGenerator
  // Outputs
  BooleanOutput PID_Active annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), 
              iconTransformation(origin = {72, 0}, extent = {{-16, -16}, {16, 16}})));

  // Internal variables
  discrete Modelica.Units.SI.Time timer(start = 0) "Discrete timer to manage state transitions";

  // State machine states
  type State = enumeration(On, Off);
  discrete State currentState(start = State.On) "Current state of the state machine";

equation
  // State transition logic using when statements
  when time >= 0 then
    timer = time; // Track time
  end when;

  // State transitions
  transition(currentState == State.On, currentState == State.Off, timer >= 120, immediate = false, reset = true, synchronize = false, priority = 1);
  transition(currentState == State.Off, currentState == State.On, timer >= 120, immediate = false, reset = true, synchronize = false, priority = 1);

  // Output assignment based on state
  PID_Active = if currentState == State.On then true else false;

  annotation(
    Icon(graphics = {Ellipse(fillColor = {227, 227, 227}, fillPattern = FillPattern.Solid, lineThickness = 3.5, extent = {{-72, 71}, {72, -71}}), Line(origin = {0, 25}, rotation = 180, points = {{0, -25}, {0, 25}, {0, 25}}, thickness = 3.5, arrow = {Arrow.Filled, Arrow.None}), Line(origin = {23.4186, 0.447284}, rotation = 90, points = {{0, -13}, {0, 25}, {0, 25}}, thickness = 3.5, arrow = {Arrow.Filled, Arrow.None})}),
  experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-06, Interval = 0.002));

end ControlTimeGenerator;
