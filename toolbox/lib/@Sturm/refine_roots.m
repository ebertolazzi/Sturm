% Given a Sturm sequence with roots separated approximate roots using Newton method.
function n_roots = refine_roots( self, tol )
  P  = self.m_sturm{1};
  NR = length(self.m_intervals);
  self.m_roots = zeros(1,NR);
  for n=1:NR
    I0 = self.m_intervals{n};
    a  = I0.a;
    b  = I0.b;
    % ------------------------
    fa = P.eval( a );
    fb = P.eval( b );
    % controlla consistenza dati del problema
    if fa * fb >= 0
      error('refine_roots something wrong in roots separations\n');
    end
    n_ok = 0;
    for iter=1:self.m_max_iter
      if abs(fa) < abs(fb)
        dx = fa/P.eval_D(a);
        x  = a - dx;
      else
        dx = fb/P.eval_D(b);
        x  = b - dx;
      end
      % If Newton failed use bisection
      ba    = b-a;
      a_min = a+0.1*ba;
      b_max = b-0.1*ba;
      if x < a_min || x > b_max
        x    = (a+b)/2;
        n_ok = 0; % if using bisection reset quasi ok iteration count
      end
      fx  = P.eval( x );
      ok1 = abs(fx) < tol;
      ok2 = abs(dx) < tol;
      if ok1 && ok2; break; end
      if ok1 || ok2
        n_ok = n_ok + 1;
        if n_ok > 3; break; end
      else
        n_ok = 0;
      end
      if fa*fx < 0
        b = x; fb = fx; % interval [a,x]
      elseif fb*fx < 0
        a = x; fa = fx; % interval [c,b]
      else
        break;
      end
    end
    self.m_roots(n) = x;
  end
end
