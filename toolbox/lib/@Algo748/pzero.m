% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function res = pzero( ~, P, FP )
  % Uses cubic inverse interpolation of f(x) at a, b, d, and e to
  % get an approximate root of f(x).
  % This procedure is a slight modification of Aitken-nNeville
  % algorithm for interpolation described by Stoer and Bulirsch
  % in "Introduction to numerical analysis" springer-verlag. new york (1980).
  a = P(1); fa = FP(1);
  b = P(2); fb = FP(2);
  d = P(3); fd = FP(3);
  e = P(4); fe = FP(4);
  Q11 = (d-e)*fd/(fe-fd);
  Q21 = (e-d)*fb/(fd-fb);
  Q31 = (a-b)*fa/(fb-fa);
  D21 = (b-d)*fd/(fd-fb);
  D31 = (a-b)*fb/(fb-fa);
  Q22 = (D21-Q11)*fb/(fe-fb);
  Q32 = (D31-Q21)*fa/(fb-fa);
  D32 = (D31-Q21)*fd/(fd-fa);
  Q33 = (D32-Q22)*fa/(fe-fa);
  % Calculate the output
  res = a+(Q31+Q32+Q33);
end
