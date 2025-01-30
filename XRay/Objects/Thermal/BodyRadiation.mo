within XRay.Objects.Thermal;

model BodyRadiation "Lumped thermal element for radiation heat transfer"
  extends Ports.HeatTwoTerminal;
  parameter Modelica.Units.SI.Area surfaceArea = 1e-6;
  // m^2
  parameter Real emissivity = 0.35;
  // Emissivity of tungsten
  //parameter Real Gr(unit="m2") "Net radiation conductance between two surfaces (see docu)";
equation
  Q_flow = Modelica.Constants.sigma*emissivity*surfaceArea*(port_1.T^4 - port_2.T^4);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(fillColor = {170, 255, 255}, fillPattern = FillPattern.Backward, extent = {{50, 80}, {90, -80}}), Rectangle(fillColor = {246, 97, 81}, fillPattern = FillPattern.Forward, extent = {{-90, 80}, {-50, -80}}), Text(textColor = {0, 0, 255}, extent = {{-150, 125}, {150, 85}}, textString = "%name"), Text(extent = {{-150, -90}, {150, -120}}, textString = "Gr=%Gr"), Rectangle(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-50, 80}, {-44, -80}}), Rectangle(lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, extent = {{45, 80}, {50, -80}}), Line(origin = {0, 38.94}, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, 38.94}, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, 6.94}, rotation = 180, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier), Line(origin = {0, -25.06}, points = {{-40, 1.05937}, {-20, 1.05937}, {-10, 21.0594}, {10, -18.9406}, {30, 1.05937}, {40, 1.05937}}, arrow = {Arrow.None, Arrow.Filled}, smooth = Smooth.Bezier)}),
    Documentation(info = "<html><head></head><body><p style=\"color: rgb(0, 0, 0); font-family: -webkit-standard; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;\"><span style=\"font-family: 'MS Shell Dlg 2'; font-size: medium;\">\"Lumped thermal element for radiation heat transfer\"</span></p><div class=\"htmlDoc\" style=\"font-family: 'MS Shell Dlg 2'; font-size: medium; color: rgb(0, 0, 0); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;\"><p>This model represents thermal radiation heat transfer between two surfaces. The heat exchange is governed by the Stefan-Boltzmann law.</p></div>
<blockquote><pre></pre></blockquote>
</body></html>"));
end BodyRadiation;
