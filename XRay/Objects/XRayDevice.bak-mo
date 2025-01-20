within XRay.Objects;

model XRayDevice
  // Components
  ElectricalCircuit circuit(V_supply=50000, R_series=10, C_parallel=1e-6) 
    "Electrical circuit providing power to the system";
  Cathode cathode(V_filament=10, R_filament=5, T_ambient=300, epsilon=0.9, A_filament=1e-6, V_applied=50000) 
    "Cathode for electron emission";
  Anode anode(theta_anode=12, eta=0.01) 
    "Anode for X-ray generation";
  Collimator collimator(aperture=0.01) 
    "Collimator for shaping the X-ray beam";
  DoseCalculator doseCalculator(targetArea=0.01, targetMass=0.1) 
    "Dose calculator for determining absorbed dose";

equation
  // Connect electrical circuit to the cathode
  connect(circuit.p, cathode.p_high) "Connect positive terminal of circuit to cathode's high-voltage pin";
  connect(circuit.n, cathode.n_high) "Connect negative terminal of circuit to cathode's ground pin";

  // Connect cathode to the anode
  connect(cathode.T, anode.T_in) "Connect cathode's thermal output to anode's thermal input";

  // Connect anode to the collimator
  connect(anode.radiationOutput, collimator.radiationInput) "Connect anode's radiation output to collimator's input";

  // Connect collimator to the dose calculator
  connect(collimator.radiationOutput, doseCalculator.radiationInput) "Connect collimator's radiation output to dose calculator's input";
end XRayDevice;

