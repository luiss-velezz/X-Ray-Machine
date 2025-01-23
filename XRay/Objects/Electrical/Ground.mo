within XRay.Objects.Electrical;

model Ground
  Ports.ElectricalPin gnd annotation (Placement(transformation(
        origin={0,100},
        extent={{10,-10},{-10,10}},
        rotation=270)));

equation
  gnd.v = 0; // Sets the voltage at the gnd pin to 0, representing the ground potential
  annotation (
    Documentation(info= "<html><head></head><body><p>Ground of an electrical circuit. The potential at the ground node is zero (it becomes the reference for all other nodes).</p>
</body></html>",
        revisions= "<html><head></head><body></body></html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-60,50},{60,50}}, color={0,0,255}),
        Line(points={{-40,30},{40,30}}, color={0,0,255}),
        Line(points={{-20,10},{20,10}}, color={0,0,255}),
        Line(points={{0,90},{0,50}}, color={0,0,255}),
        Text(
          extent={{-150,-10},{150,-50}},
          textString="%name",
          textColor={0,0,255})}));

end Ground;