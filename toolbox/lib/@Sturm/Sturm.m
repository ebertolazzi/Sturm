%>  
%> Class storing a Sturm sequence
%>
%>
%> **Reference**
%>
classdef Sturm < handle
  %% MATLAB class wrapper for the underlying C++ class
  properties (SetAccess = private, Hidden = true)
    m_sturm;
    m_intervals;
    m_a;
    m_b;
    m_roots;
    m_max_iter;
  end

  methods (Hidden = true)
  end

  methods
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function self = Sturm()
      self.m_sturm     = {};
      self.m_intervals = {};
      self.m_a         = 0;
      self.m_b         = 0;
      self.m_roots     = zeros(0,0);
      self.m_max_iter  = 20;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function delete( self )
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function [a,b] = get_ab( self )
      a = self.m_a;
      b = self.m_b;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function n = n_intervals( self )
      n = length(self.m_intervals);
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function I = get_interval( self, ipos )
      I = self.m_intervals{ipos};
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function n = n_roots( self )
      n = length(self.m_roots);
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function r = roots( self )
      r = self.m_roots;
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function P = get( self, ipos )
      P = self.m_sturm{ipos};
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function len = length( self )
      len = length(self.m_sturm);
    end
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    build( self, poly );
    separate_roots( self, a, b );
    refine_roots( self, tol );
    s   = sign_variations( self, x );
    res = get_intervals( self );
    str = to_string( self );
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function print( self )
      fprintf('%s\n',self.to_string());
    end
  end
end
