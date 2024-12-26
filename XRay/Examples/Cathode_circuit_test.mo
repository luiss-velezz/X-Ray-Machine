within XRay.Examples;

model Cathode_circuit_test
  
  Objects.Electrical.VsourceWindow V(Vdc = 50000, t_Start = 0.5, t_End = 1);
  Objects.Electrical.Resistor R1(R=10);
  //Objects.Electrical.VsourceDC V(Vdc = 50000);
  //Objects.Beam.Cathode Cat;
  Objects.Ground GND;
  
equation

  connect(V.p, R1.p);
  connect(R1.n, V.n);
  //connect(Cat.p, V.n);
  connect(V.n, GND.gnd);

end Cathode_circuit_test;