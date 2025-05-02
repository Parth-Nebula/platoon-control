classdef  FileDeserializer < casadi.DeserializerBase
    %FILEDESERIALIZER [INTERNAL] C++ includes: serializer.hpp
    %
    %
    %
    %
  methods
    function self = FileDeserializer(varargin)
    %FILEDESERIALIZER [INTERNAL] 
    %
    %  new_obj = FILEDESERIALIZER()
    %
    %Advanced deserialization of CasADi objects.
    %
    %See: 
    % FileSerializer
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.hpp#L258
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.cpp#L108-L114
    %
    %
    %
      self@casadi.DeserializerBase(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1238, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1239, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
