within XRay.Objects.Logic;

class SquareWave

  parameter Modelica.Units.SI.Time first=0, onTime=0.5, offTime=240;
  Real x(start=1);
  Boolean clk;
  
equation
  // Generate clock signal with custom on/off periods
  clk = sample(first, onTime + offTime); // Total period is onTime + offTime
  
  when clk then 
    // Toggle x between 1 and 0
    if x == 1 then
      x = 0; // Off state after onTime
    else
      x = 1; // On state after offTime
    end if;
  end when;

annotation(
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 2));
end SquareWave;
