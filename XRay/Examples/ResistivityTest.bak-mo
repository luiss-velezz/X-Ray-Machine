within XRay.Examples;

model ResistivityTest "Example DC circuit to validate Electrical Components"
  // Instantiate components
  Objects.Electrical.DynamicResistor R1(R = 100e3);
  // Resistor with 100 Ohms
  Objects.Electrical.Capacitor C1(C = 1e-6);
  // Capacitor with 1 microFarad
  Objects.Electrical.VsourceWindow V1(Vdc = 220, t_Start = 0.5, t_End = 1);
  // AC Voltage source with 220V amplitude and 50Hz frequency
  Objects.Ground GND;
  // Ground connection
  
  annotation(experiment(StartTime=0, StopTime=1, Interval=0.01));
  
equation
  connect(V1.p, R1.p);
  connect(R1.n, C1.p);
  connect(C1.n, V1.n);
  connect(V1.n, GND.gnd);
  
initial equation
  C1.v = 0;
end ResistivityTest;