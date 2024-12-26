within XRay.Objects.Electrical;

model VsourceWindow "Voltage source with active time window"
  extends Objects.TwoTerminal;    // Extends the TwoTerminal model, inheriting its properties and equations

  parameter Modelica.Units.SI.Voltage Vdc = 220 "Voltage";      // Define a parameter V representing the voltage
  parameter Modelica.Units.SI.Time t_Start = 0.5 "Start time";  // Define a parameter t_Start for the start time
  parameter Modelica.Units.SI.Time t_End = 1 "End time";      // Define a parameter t_End for the end time

equation
  // Conditional voltage equation: The voltage (v) is V between t_Start and t_End, otherwise it is 0
  v = if (time >= t_Start and time <= t_End) then Vdc else 0;
end VsourceWindow;
