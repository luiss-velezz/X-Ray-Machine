within XRay.Objects.Electrical; // Specifies that the model is within the XRay.Objects.Electrical package

model Ground  // Defines the model named Ground
  XRay.Connectors.ElectricalPin gnd; // Declares a connector named gnd of type ElectricalPin from the XRay.Connectors package
equation
  gnd.v = 0; // Sets the voltage at the gnd pin to 0, representing the ground potential
end Ground; // Ends the definition of the Ground model
