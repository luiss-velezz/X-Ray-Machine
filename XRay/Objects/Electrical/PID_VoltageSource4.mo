within XRay.Objects.Electrical;

model PID_VoltageSource4
  "Controlled voltage source with a PID controller for temperature-based voltage output regulation"

// Parameters for PID controller
  parameter Modelica.Units.SI.Temperature T_ref(min = 273.15) = 2300 "Setpoint temperature in Kelvin";
  parameter Real K_p = 1 "Proportional gain";
  parameter Real K_i = 0.1 "Integral gain";
  parameter Real K_d = 0.01 "Derivative gain";
  parameter Modelica.Units.SI.Voltage V_max(min = 0) = 20 "Maximum output voltage";

// Internal variables
  Real error "Temperature error";
  Real integral "Integral term";
  Real derivative "Derivative term";
  Real controlSignal "Control signal output from PID controller";
  Modelica.Units.SI.Voltage sourceVoltage "Voltage provided by the source";
  Real setpoint;

// Ports
  Ports.PositivePin p annotation(
    Placement(transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}})));
  Ports.NegativePin n annotation(
    Placement(transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));
  Logic.RealInput TemperatureInput annotation(
    Placement(transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}})));  
    
  equation // Setpoint logic
    setpoint = if time < 500 then 
                 T_ref 
               else if time <= 6500 then 
                 if mod(time - 500, 1200) < 600 then T_ref else 1200 
               else 
                 1200;
// Temperature error calculation
    error = setpoint - TemperatureInput;
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
    
  initial equation
    integral = 1;

  annotation(
    Diagram(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}), Text(extent = {{-50, 50}, {50, -50}}, textString = "PID Voltage Source")}),
    Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 127}, extent = {{-100, 100}, {100, -100}}), Rectangle(origin = {17, 49}, extent = {{-25, 15}, {25, -15}}), Rectangle(origin = {17, -1}, extent = {{-25, 15}, {25, -15}}), Rectangle(origin = {17, -51}, extent = {{-25, 15}, {25, -15}}), Line(origin = {-65, 0}, points = {{-19, 0}, {19, 0}}, arrow = {Arrow.None, Arrow.Filled}), Ellipse(origin = {-36, 0}, extent = {{-8, 8}, {8, -8}}), Text(origin = {-39, 3}, extent = {{-1, 1}, {1, -1}}, textString = "+"), Text(origin = {-37, -4}, extent = {{1, 0}, {-1, 0}}, textString = "-"), Rectangle(origin = {-53, -47}, extent = {{-25, 15}, {25, -15}}), Text(origin = {-54, -48}, extent = {{-16, 8}, {16, -8}}, textString = "%T_ref"), Line(origin = {-35.6416, -21.8844}, rotation = 90, points = {{-11, 0}, {13, 0}}, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {17, 49}, extent = {{-19, 5}, {19, -5}}, textString = "k_p*error"), Line(origin = {-18, 0}, points = {{-10, 0}, {10, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-14.05, 25}, points = {{-5.94721, -25}, {-5.94721, 25}}), Line(origin = {-14, 50}, points = {{-6, 0}, {6, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-14, -26}, points = {{-6, 26}, {-6, -26}, {6, -26}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {42.1538, 0.206948}, points = {{0, -1}, {10, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {46, 50}, points = {{4, 0}, {-4, 0}, {-4, 0}}), Line(origin = {46, -52}, points = {{4, 0}, {-4, 0}, {-4, 0}}), Ellipse(origin = {60, 0}, extent = {{-8, 8}, {8, -8}}), Text(origin = {61, 1}, extent = {{-9, 7}, {9, -7}}, textString = "+"), Line(origin = {55, 29}, points = {{-5, 21}, {5, 21}, {5, -21}, {5, -21}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {55, -52}, points = {{-5, 0}, {5, 0}, {5, 0}}), Line(origin = {60, -30}, points = {{0, -22}, {0, 22}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {40, 49}, points = {{28, -49}, {40, -49}, {40, 31}, {-40, 31}, {-40, 49}, {-40, 49}}), Text(origin = {17, -1}, extent = {{-19, 5}, {19, -5}}, textString = "k_i*int(error)"), Text(origin = {18, -51}, extent = {{-20, 5}, {20, -5}}, textString = "k_p*der(error)")}),
    Documentation(info = "<html><head></head><body><!--StartFragment--><p><strong>Overview</strong><br>The <strong>PID_VoltageSource4</strong> model implements a temperature-controlled voltage source using a PID controller with a dynamic setpoint. Unlike a fixed setpoint controller, this model adjusts its setpoint over time according to a predefined schedule. The controller reads a temperature input, computes an error relative to a time-varying setpoint, and uses PID action (proportional, integral, and derivative) to generate a control signal. This signal is then converted into an output voltage that is clamped between 0 and a maximum value, V_max. The voltage is applied across the positive and negative electrical pins.</p><hr><p><strong>Key Concepts and Equations</strong></p><ol><li><p><strong>Dynamic Setpoint Logic</strong></p><ul><li><strong>Purpose:</strong> The setpoint for the PID controller changes over time to simulate different operating conditions.</li><li><strong>Definition:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"flex items-center text-token-text-secondary px-4 py-2 text-xs font-sans justify-between rounded-t-md h-9 bg-token-sidebar-surface-primary dark:bg-token-main-surface-secondary select-none\"><br></div><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\">setpoint = <span class=\"hljs-keyword\">if</span> <span class=\"hljs-built_in\">time</span> &lt; <span class=\"hljs-number\">500</span> <span class=\"hljs-keyword\">then</span> 
             T_ref 
           <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> <span class=\"hljs-built_in\">time</span> &lt;= <span class=\"hljs-number\">6500</span> <span class=\"hljs-keyword\">then</span> 
             <span class=\"hljs-keyword\">if</span> <span class=\"hljs-built_in\">mod</span>(<span class=\"hljs-built_in\">time</span> - <span class=\"hljs-number\">500</span>, <span class=\"hljs-number\">1200</span>) &lt; <span class=\"hljs-number\">600</span> <span class=\"hljs-keyword\">then</span> T_ref <span class=\"hljs-keyword\">else</span> <span class=\"hljs-number\">1200</span> 
           <span class=\"hljs-keyword\">else</span> 
             <span class=\"hljs-number\">1200</span>;
</code></div></div></pre><ul><li>For <strong>time &lt; 500 seconds</strong>, the setpoint is equal to the reference temperature (T_ref).</li><li>For <strong>500 ≤ time ≤ 6500 seconds</strong>, the setpoint alternates between T_ref and 1200 Kelvin. This alternation is determined by the remainder when (time − 500) is divided by 1200; if this remainder is less than 600, the setpoint is T_ref, otherwise it is 1200.</li><li>For <strong>time &gt; 6500 seconds</strong>, the setpoint is fixed at 1200 Kelvin.</li></ul></li></ul></li><li><p><strong>Temperature Error Calculation</strong></p><ul><li><strong>Purpose:</strong> Compute the difference between the dynamic setpoint and the measured temperature.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span class=\"hljs-attr\">error</span> = setpoint - TemperatureInput
</code></div></div></pre><ul><li><em>TemperatureInput</em> is the measured temperature provided as an input.</li></ul></li></ul></li><li><p><strong>PID Controller Components</strong></p><ul><li><strong>Integral Term:</strong><ul><li><strong>Purpose:</strong> Accumulate the error over time to eliminate steady-state error.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\">der(integral) = <span class=\"hljs-type\">error</span>
</code></div></div></pre></li></ul></li><li><strong>Derivative Term:</strong><ul><li><strong>Purpose:</strong> Estimate the rate of change of the error to provide damping.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span class=\"hljs-attr\">derivative</span> = der(error)
</code></div></div></pre></li></ul></li><li><strong>Control Signal Calculation:</strong><ul><li><strong>Purpose:</strong> Combine the proportional, integral, and derivative terms.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span class=\"hljs-attr\">controlSignal</span> = K_p * error + K_i * integral + K_d * derivative
</code></div></div></pre></li></ul></li></ul></li><li><p><strong>Output Voltage Limiting</strong></p><ul><li><strong>Purpose:</strong> Ensure the output voltage does not exceed the maximum allowed value.</li><li><strong>Equation:</strong><pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\">sourceVoltage = if controlSignal &gt; V_max then V_max <span class=\"hljs-keyword\">else</span> if controlSignal &lt; 0 then 0 <span class=\"hljs-keyword\">else</span> controlSignal
</code></div></div></pre><ul><li>This clamps the voltage between 0 and V_max.</li></ul></li></ul></li><li><p><strong>Electrical Connections</strong></p><ul><li>The controlled voltage is applied at the positive pin:<pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\"><span class=\"hljs-attr\">p.v</span> = sourceVoltage
</code></div></div></pre></li><li>The sum of the currents at the positive and negative pins is maintained at zero:<pre class=\"!overflow-visible\"><div class=\"contain-inline-size rounded-md border-[0.5px] border-token-border-medium relative bg-token-sidebar-surface-primary dark:bg-gray-950\"><div class=\"overflow-y-auto p-4\" dir=\"ltr\"><code class=\"!whitespace-pre\">p.i + n.i = 0
</code></div></div></pre></li><li><strong>Initial Condition:</strong><ul><li>The integral term is initialized to 1 to start the integration process.</li></ul></li></ul></li></ol><hr><p><strong>Model Parameters</strong></p><ul><li><p><strong>T_ref (Temperature):</strong></p><ul><li>The reference temperature (setpoint) in Kelvin used when time is less than 500 seconds and during part of the alternating phase.</li></ul></li><li><p><strong>K_p (Proportional Gain):</strong></p><ul><li>Scales the instantaneous error.</li></ul></li><li><p><strong>K_i (Integral Gain):</strong></p><ul><li>Scales the accumulated error over time.</li></ul></li><li><p><strong>K_d (Derivative Gain):</strong></p><ul><li>Scales the rate of change of the error.</li></ul></li><li><p><strong>V_max (Voltage):</strong></p><ul><li>The maximum output voltage of the source.</li></ul></li></ul><hr><p><strong>Ports</strong></p><ul><li><p><strong>PositivePin (p):</strong></p><ul><li>The electrical positive connection that outputs the controlled voltage.</li></ul></li><li><p><strong>NegativePin (n):</strong></p><ul><li>The electrical negative connection (return path) of the circuit.</li></ul></li><li><p><strong>TemperatureInput (Logic.RealInput):</strong></p><ul><li>The input port through which the measured temperature is received.</li></ul></li></ul><hr><p><strong>Usage Notes</strong></p><ul><li><strong>Dynamic Control:</strong><ul><li>The time-dependent setpoint allows simulation of different operating regimes. For instance, the system can be tested for its response when the desired temperature alternates between high and low values.</li></ul></li><li><strong>PID Tuning:</strong><ul><li>Adjust <em>K_p</em>, <em>K_i</em>, and <em>K_d</em> based on the desired response characteristics (e.g., overshoot, settling time) of your system.</li></ul></li><li><strong>Voltage Safety:</strong><ul><li>The output voltage is limited to ensure that the control signal remains within a safe and operational range.</li></ul></li><li><strong>Initial Conditions:</strong><ul><li>The integral term is initialized to a nonzero value (1) to provide a starting point for the integration of the error.</li></ul></li></ul><!--EndFragment--></body></html>"));
end PID_VoltageSource4;
