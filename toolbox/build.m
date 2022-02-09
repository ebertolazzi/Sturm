% Given a polynimial P(x) build its Sturm sequence
%
function build( self, P )
  self.m_intervals = {};
  self.m_sturm     = {};
  self.m_sturm{1}  = P;
  self.m_sturm{2}  = P.derivative();
  ns = 2;
  % apply Euclide GCD algorithm
  while true
    [M,R] = self.m_sturm{ns-1}.divide( self.m_sturm{ns} );
    if R.order() <= 0; break; end
    ns = ns + 1; self.m_sturm{ns} = -R;
  end
  % divide by GCD
  g = self.m_sturm{ns};
  for i=1:ns-1
    [M,R] = self.m_sturm{i}.divide( g );
    M.normalize();
    self.m_sturm{i} = M;
  end
  self.m_sturm{ns}.set_scalar(1);
end