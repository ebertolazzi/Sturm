%>  
%> Class storing a polynomial
%>
%>
%> **Reference**
%>
classdef Poly < handle
  %% MATLAB class wrapper for the underlying C++ class
  properties (SetAccess = private, Hidden = true)
    m_order;
    m_coeffs;
  end

  methods (Hidden = true)
  end

  methods
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function self = Poly( coeffs )
      if nargin == 0
        self.m_coeffs = zeros(1,0);
      elseif nargin == 1
        self.m_coeffs = coeffs(:).';
      else
        error('Poly constructor, bad number of arguments');
      end
      self.m_order = length(self.m_coeffs);
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function delete( self )
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = order( self )
      res = self.m_order;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = degree( self )
      res = self.m_order-1;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function cfs = coeffs( self )
      cfs = self.m_coeffs;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = set_order( self, order )
      self.m_coeffs = zeros(1,order);
      self.m_order  = order;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = set_degree( self, degree )
      self.m_coeffs = zeros(1,degree+1);
      self.m_order  = degree+1;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = set_scalar( self, a )
      self.m_coeffs = a;
      self.m_order  = 1;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = set_monomial( self, a )
      self.m_coeffs = [a,1];
      self.m_order  = 2;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function res = set_by_coeffs( self, coeffs )
      self.m_coeffs = coeffs;
      self.m_order  = length(coeffs);
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function p = eval( self, x )
      p = self.m_coeffs(end)*ones(size(x));
      for n=self.m_order-1:-1:1
        p = p.*x+self.m_coeffs(n);
      end
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function dp = eval_D( self, x )
      dp = self.m_coeffs(end)*ones(size(x));
      for n=self.m_order-1:-1:2
        dp = dp.*x+self.m_coeffs(n)*(n-1);
      end
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function purge( self, epsi )
      IDX = find( abs(seld.m_coeffs) <= epsi );
      self.m_coeffs(IDX) = 0;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function S = normalize( self )
      S = max(max(abs(self.m_coeffs)));
      if S > 0; self.m_coeffs = self.m_coeffs./S; end;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    res = plus(self,b)
    res = minus(self,b)
    res = uplus(self,b)
    res = uminus(self,b)
    res = mtimes(self,b)
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    out = to_string( self )
    res = derivative( self )
    res = integral( self )
    adjust_degree( self )
    [M,R] = divide( self, q )
    G = GCD( self, q )
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function print( self )
      fprintf('%s\n',self.to_string());
    end
  end
end
