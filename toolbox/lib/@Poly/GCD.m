% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function G = GCD( self, Q )
  if Q.order() > 0
    [M,R] = self.divide( Q );
    G = Q.GCD( R );
  else
    G = self;
  end
  G.normalize();
end