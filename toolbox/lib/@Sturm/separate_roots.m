% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function n_roots = separate_roots( self, a, b )
  self.m_a = a;
  self.m_b = b;
  va      = self.sign_variations(a);
  vb      = self.sign_variations(b);
  n_roots = abs( va - vb );

  if n_roots == 0; return; end

  self.m_intervals = cell(1,n_roots);
  I0.a = a; I0.va = va;
  I0.b = b; I0.vb = vb;
  self.m_intervals{1} = I0;

  if n_roots == 1; return; end

  % search intervals
  i_pos = 1;
  n_seg = 1;
  
  while i_pos <= n_roots
    I0 = self.m_intervals{i_pos};
    % refine segment
    c  = (I0.a+I0.b)/2;
    vc = self.sign_variations(c);
    if I0.va == vc % LO <- c
      I0.a  = c;
      I0.va = vc;
      self.m_intervals{i_pos} = I0;
    elseif I0.vb == vc % HI <- c
      I0.b  = c;
      I0.vb = vc;
      self.m_intervals{i_pos} = I0;
    else % split interval!
      % second interval
      n_seg = n_seg+1;
      I1.a = c;    I1.va = vc;
      I1.b = I0.b; I1.vb = I0.vb;
      self.m_intervals{n_seg} = I1;

      % first interval
      I0.b = c; I0.vb = vc;
      self.m_intervals{i_pos} = I0;

      % skip interval with sign variation == 1
      while i_pos <= n_seg
        I2 = self.m_intervals{i_pos};
        if abs( I2.vb - I2.va ) > 1
          break; % found interval to be analysed
        end
        i_pos = i_pos + 1;
      end
    end
  end
  % sort intervals
  [~, order]       = sort(squeeze([cell2mat(self.m_intervals).a]));
  self.m_intervals = self.m_intervals(order);
end
