within XRay.Examples;

model DC_circuit_test "Example DC circuit to validate Electrical Components"
  // Instantiate components
  XRay.Objects.Electrical.Resistor R1(R=100);       // Resistor with 100 Ohms
  XRay.Objects.Electrical.Capacitor C1(C=1e-6);     // Capacitor with 1 microFarad
  XRay.Objects.Electrical.VsourceDC V1(Vdc=220); // AC Voltage source with 220V amplitude and 50Hz frequency
  XRay.Objects.Electrical.Ground GND;                 // Ground connection
  
equation
  connect(V1.p, C1.p);
  connect(C1.n, R1.p);
  connect(R1.n, V1.n);
  connect(V1.n, GND.gnd);
  
initial equation
  C1.v = 0;
  
end DC_circuit_test;