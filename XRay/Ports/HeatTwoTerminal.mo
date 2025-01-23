within XRay.Ports;

partial model HeatTwoTerminal
  "Partial heat transfer element with two HeatPort connectors that does not store energy"

  Modelica.Units.SI.HeatFlowRate Q_flow
    "Heat flow rate from port_a -> port_b";
  Modelica.Units.SI.TemperatureDifference dT "port_a.T - port_b.T";
public
  ThermalPin_1 port_1 annotation (Placement(transformation(extent={{-110,-10},
            {-90,10}})));
  ThermalPin_2 port_2 annotation (Placement(transformation(extent={{90,-10},{
            110,10}})));
equation
  dT = port_1.T - port_2.T;
  port_1.Q_flow = Q_flow;
  port_2.Q_flow = -Q_flow;
  annotation (Documentation(info="<html>
<p>
This partial model contains the basic connectors and variables to
allow heat transfer models to be created that <strong>do not store energy</strong>,
This model defines and includes equations for the temperature
drop across the element, <strong>dT</strong>, and the heat flow rate
through the element from port_a to port_b, <strong>Q_flow</strong>.
</p>
<p>
By extending this model, it is possible to write simple
constitutive equations for many types of heat transfer components.
</p>
</html>"));

end HeatTwoTerminal;