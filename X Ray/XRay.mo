package XRay
    model Cathode
  equation

  annotation(
      Icon(graphics = {Polygon(points = {{-60, 20}, {60, 20}, {60, -20}, {-60, -20}, {-60, 20}, {-60, 20}})}));
end Cathode;

  model Anode
  equation

  annotation(
      Icon(graphics = {Polygon(points = {{-20, 20}, {-20, 60}, {20, 60}, {20, 20}, {60, 20}, {60, -20}, {20, -20}, {20, -60}, {-20, -60}, {-20, -20}, {-60, -20}, {-60, 20}, {-60, 20}, {-20, 20}})}));
end Anode;

  model Voltage_source
  equation

  annotation(
      Icon(graphics = {Line(origin = {-20, 0}, points = {{0, 40}, {0, -40}, {0, -40}}, thickness = 1), Line(origin = {20, 0}, points = {{0, 20}, {0, -20}, {0, -20}}, thickness = 1), Text(origin = {2, -59}, extent = {{-100, 13}, {100, -13}}, textString = "V=%V"), Text(origin = {3, 54}, textColor = {0, 0, 255}, extent = {{-150, 15}, {150, -15}}, textString = "%name")}));
end Voltage_source;
end XRay;
