within XRay.Examples;

model DC_window_circuit_test "Example DC circuit to validate Electrical Components"
  // Instantiate components
  Objects.Electrical.Resistor R1(R = 100);
  // Resistor with 100 Ohms
  Objects.Electrical.Capacitor C1(C = 1e-6);
  // Capacitor with 1 microFarad
  Objects.Electrical.VsourceWindow V1(Vdc = 220, t_Start = 0.5, t_End = 1);
  // AC Voltage source with 220V amplitude and 50Hz frequency
  Objects.Electrical.Ground GND;
  // Ground connection
equation
  connect(V1.p, C1.p);
  connect(C1.n, R1.p);
  connect(R1.n, V1.n);
  connect(V1.n, GND.gnd);
initial equation
  C1.v = 0;
end DC_window_circuit_test;