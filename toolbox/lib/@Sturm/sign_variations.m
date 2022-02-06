% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function sign_var = sign_variations( self, x )
  sign_var  = 0;
  last_sign = 0;
  for i=1:length(self.m_sturm)
    v = self.m_sturm{i}.eval(x);
    if v > 0
      if last_sign == -1
        sign_var = sign_var+1;
      end
      last_sign = 1;
    elseif v < 0
      if last_sign == 1
        sign_var = sign_var+1;
      end
      last_sign = -1;
    end
  end
end
