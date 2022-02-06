% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function res = derivative( self )
  der = zeros( 1, self.m_order-1 );
  for i=1:self.m_order-1
    der(i) = i * self.m_coeffs(i+1);
  end
  res = Poly( der );
end
