within XRay.Objects.Electrical;

  partial model TwoTerminal "Two Terminal model for 2 terminal elements"
    Connectors.ElectricalPin p, n;           // Define two electrical pins: p (positive) and n (negative)
    Modelica.Units.SI.Voltage v;          // Define the voltage across the two terminals
    Modelica.Units.SI.Current i;          // Define the current through the component
  equation
    // Kirchhoff's Voltage Law (KVL): The voltage across the component
    // is the difference between the voltages at pins p and n
    v = p.v - n.v;

    // Kirchhoff's Current Law (KCL): The sum of currents entering and leaving the component
    // must be zero. This ensures that current flowing into pin p is equal to the current
    // flowing out of pin n
    0 = p.i + n.i;

    // The current through the component is the current through pin p (defining positive current flow from higher to lower pot.)
    i = p.i;

end TwoTerminal;