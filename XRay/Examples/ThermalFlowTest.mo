within XRay.Examples;

model ThermalFlowTest

  Objects.Electrical.Filament F1;
  Objects.Electrical.VsourceDC V1(Vdc=20);
  //Objects.Beam.Cathode_bak Cat(T_ambient = 300, epsilon = 0.9, A_filament = 1e-6);
  Objects.Ground GND;

equation

  connect(V1.p, F1.p);
  connect(F1.n, V1.n);
  connect(V1.n, GND.gnd);

end ThermalFlowTest;