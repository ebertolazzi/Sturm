% Given a Sturm sequence with roots separated approximate roots using Newton method.
function n_roots = refine_roots( self, tol )
  P            = self.m_sturm{1};
  NR           = length(self.m_intervals);
  self.m_roots = zeros(1,NR);
  fun          = @(x) P.eval(x);
  for n=1:NR
    I0              = self.m_intervals{n};
    [sol,iter]      = self.m_solver.eval( I0.a, I0.b, fun );
    self.m_roots(n) = sol;
  end
end
