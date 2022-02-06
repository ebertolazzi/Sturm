    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = uminus(self)
      res = Poly(-self.m_coeffs);
    end