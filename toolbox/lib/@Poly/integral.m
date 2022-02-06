% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function res = integral( self )
  itg = zeros( 1, self.m_order+1 );
  for i=1:self.m_order
    itg(i+1) = self.m_coeffs(i)/i;
  end
  res = Poly(itg);
end
