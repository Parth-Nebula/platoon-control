classdef  MetaCon < casadi.IndexAbstraction
    %METACON 
    %
    %   = METACON()
    %
    %
  methods
    function v = original(self)
      v = casadiMEX(1289, self);
    end
    function v = canon(self)
      v = casadiMEX(1290, self);
    end
    function v = type(self)
      v = casadiMEX(1291, self);
    end
    function v = lb(self)
      v = casadiMEX(1292, self);
    end
    function v = ub(self)
      v = casadiMEX(1293, self);
    end
    function v = n(self)
      v = casadiMEX(1294, self);
    end
    function v = flipped(self)
      v = casadiMEX(1295, self);
    end
    function v = dual_canon(self)
      v = casadiMEX(1296, self);
    end
    function v = dual(self)
      v = casadiMEX(1297, self);
    end
    function v = extra(self)
      v = casadiMEX(1298, self);
    end
    function v = linear_scale(self)
      v = casadiMEX(1299, self);
    end
    function self = MetaCon(varargin)
    %METACON 
    %
    %  new_obj = METACON()
    %
    %
      self@casadi.IndexAbstraction(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1300, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1301, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
