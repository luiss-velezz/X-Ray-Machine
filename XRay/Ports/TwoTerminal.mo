within XRay.Ports;

partial model TwoTerminal
  Modelica.Units.SI.Voltage v "Voltage drop of the two pins (= p.v - n.v)";
  Modelica.Units.SI.Current i "Current flowing from pin p to pin n";

  PositivePin p "Positive electrical pin"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  NegativePin n "Negative electrical pin"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  annotation (
    Documentation(info="<html>
<p>Superclass of elements which have <strong>two</strong> electrical pins: the positive pin connector <em>p</em>, and the negative pin connector <em>n</em>. It is assumed that the current flowing into pin p is identical to the current flowing out of pin n. This current is provided explicitly as current i.</p>
</html>",
 revisions="<html>
<ul>
<li><em> 1998   </em>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));


end TwoTerminal;