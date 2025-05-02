classdef  DaeBuilder < casadi.SharedObject & casadi.PrintableCommon
    %DAEBUILDER [INTERNAL] 
    %
    %
    %A symbolic representation of a differential-algebraic equations 
    %model.
    %
    %Variables:
    %==========
    %
    %
    %
    %
    %
    %::
    %
    %  t:      independent variable (usually time)
    %  c:      constants
    %  p:      parameters
    %  d:      dependent parameters (time independent)
    %  u:      controls
    %  w:      dependent variables  (time dependent)
    %  x:      differential states
    %  z:      algebraic variables
    %  q:      quadrature states
    %  y:      outputs
    %  
    %
    %
    %
    %Equations:
    %==========
    %
    %
    %
    %
    %
    %::
    %
    %  differential equations: \\dot{x} ==  ode(...)
    %  algebraic equations:          0 ==  alg(...)
    %  quadrature equations:   \\dot{q} == quad(...)
    %  dependent parameters:         d == ddef(d_prev,p)
    %  dependent variables:          w == wdef(w_prev,x,z,u,p,t)
    %  output equations:             y == ydef(...)
    %  initial equations:     init_lhs == init_rhs(...)
    %  events:      when when_cond < 0: when_lhs := when_rhs
    %  
    %
    %
    %
    %Joel Andersson
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5c
    %
    %C++ includes: dae_builder.hpp
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = type_name(self,varargin)
    %TYPE_NAME [INTERNAL] 
    %
    %  char = TYPE_NAME(self)
    %
    %Readable name of the class.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L74
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L74-L74
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1036, self, varargin{:});
    end
    function varargout = name(self,varargin)
    %NAME [INTERNAL] 
    %
    %  char = NAME(self)
    %
    %Name of instance.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L86
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L59-L61
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1037, self, varargin{:});
    end
    function varargout = time(self,varargin)
    %TIME [INTERNAL] 
    %
    %  MX = TIME(self)
    %
    %Expression for independent variable (usually time)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2by
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L93
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L63-L71
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1038, self, varargin{:});
    end
    function varargout = t_new(self,varargin)
    %T_NEW [INTERNAL] 
    %
    %  {char} = T_NEW(self)
    %
    %Independent variable (usually time)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2bz
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L98
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L98-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1039, self, varargin{:});
    end
    function varargout = x(self,varargin)
    %X [INTERNAL] 
    %
    %  {char} = X(self)
    %
    %Differential states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5f
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L103
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L103-L103
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1040, self, varargin{:});
    end
    function varargout = y(self,varargin)
    %Y [INTERNAL] 
    %
    %  {char} = Y(self)
    %
    %Outputs */.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L106
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L73-L80
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1041, self, varargin{:});
    end
    function varargout = ode(self,varargin)
    %ODE [INTERNAL] 
    %
    %  {MX} = ODE(self)
    %
    %Ordinary differential equations (ODE)
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5g
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L111
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L82-L89
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1042, self, varargin{:});
    end
    function varargout = z(self,varargin)
    %Z [INTERNAL] 
    %
    %  {char} = Z(self)
    %
    %Algebraic variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5h
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L116
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L116-L116
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1043, self, varargin{:});
    end
    function varargout = alg(self,varargin)
    %ALG [INTERNAL] 
    %
    %  {MX} = ALG(self)
    %
    %Algebraic equations.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5i
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L121
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L91-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1044, self, varargin{:});
    end
    function varargout = q(self,varargin)
    %Q [INTERNAL] 
    %
    %  {char} = Q(self)
    %
    %Quadrature states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5j
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L126
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L126-L126
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1045, self, varargin{:});
    end
    function varargout = quad(self,varargin)
    %QUAD [INTERNAL] 
    %
    %  {MX} = QUAD(self)
    %
    %Quadrature equations.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5k
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L131
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L100-L107
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1046, self, varargin{:});
    end
    function varargout = zero(self,varargin)
    %ZERO [INTERNAL] 
    %
    %  {MX} = ZERO(self)
    %
    %Zero-crossing functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L136
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L109-L115
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1047, self, varargin{:});
    end
    function varargout = ydef(self,varargin)
    %YDEF [INTERNAL] 
    %
    %  {MX} = YDEF(self)
    %
    %Definitions of output variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5m
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L141
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L117-L124
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1048, self, varargin{:});
    end
    function varargout = u(self,varargin)
    %U [INTERNAL] 
    %
    %  {char} = U(self)
    %
    %Free controls.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5n
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L146
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L146-L146
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1049, self, varargin{:});
    end
    function varargout = p(self,varargin)
    %P [INTERNAL] 
    %
    %  {char} = P(self)
    %
    %Parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5o
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L151
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L151-L151
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1050, self, varargin{:});
    end
    function varargout = c(self,varargin)
    %C [INTERNAL] 
    %
    %  {char} = C(self)
    %
    %Named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L156
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L156-L156
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1051, self, varargin{:});
    end
    function varargout = cdef(self,varargin)
    %CDEF [INTERNAL] 
    %
    %  {MX} = CDEF(self)
    %
    %Definitions of named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5q
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L161
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L126-L133
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1052, self, varargin{:});
    end
    function varargout = d(self,varargin)
    %D [INTERNAL] 
    %
    %  {char} = D(self)
    %
    %Dependent parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5r
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L166
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L166-L166
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1053, self, varargin{:});
    end
    function varargout = ddef(self,varargin)
    %DDEF [INTERNAL] 
    %
    %  {MX} = DDEF(self)
    %
    %Definitions of dependent parameters.
    %
    %Interdependencies are allowed but must be non-cyclic.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5s
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L173
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L135-L142
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1054, self, varargin{:});
    end
    function varargout = w(self,varargin)
    %W [INTERNAL] 
    %
    %  {char} = W(self)
    %
    %Dependent variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L178
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L178-L178
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1055, self, varargin{:});
    end
    function varargout = wdef(self,varargin)
    %WDEF [INTERNAL] 
    %
    %  {MX} = WDEF(self)
    %
    %Dependent variables and corresponding definitions.
    %
    %Interdependencies are allowed but must be non-cyclic.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_5u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L185
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L144-L151
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1056, self, varargin{:});
    end
    function varargout = init_lhs(self,varargin)
    %INIT_LHS [INTERNAL] 
    %
    %  {MX} = INIT_LHS(self)
    %
    %Initial conditions, left-hand-side.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L190
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L153-L155
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1057, self, varargin{:});
    end
    function varargout = init_rhs(self,varargin)
    %INIT_RHS [INTERNAL] 
    %
    %  {MX} = INIT_RHS(self)
    %
    %Initial conditions, right-hand-side.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2b2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L195
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L157-L159
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1058, self, varargin{:});
    end
    function varargout = outputs(self,varargin)
    %OUTPUTS [INTERNAL] 
    %
    %  {char} = OUTPUTS(self)
    %
    %Model structure: outputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_61
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L200
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L161-L168
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1059, self, varargin{:});
    end
    function varargout = derivatives(self,varargin)
    %DERIVATIVES [INTERNAL] 
    %
    %  {char} = DERIVATIVES(self)
    %
    %Model structure: derivatives.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_62
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L205
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L170-L177
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1060, self, varargin{:});
    end
    function varargout = initial_unknowns(self,varargin)
    %INITIAL_UNKNOWNS [INTERNAL] 
    %
    %  {char} = INITIAL_UNKNOWNS(self)
    %
    %Model structure: initial unknowns.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_63
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L210
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L179-L186
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1061, self, varargin{:});
    end
    function varargout = has_t(self,varargin)
    %HAS_T [INTERNAL] 
    %
    %  bool = HAS_T(self)
    %
    %Is there a time variable?
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_64
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L218
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L188-L195
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1062, self, varargin{:});
    end
    function varargout = nx(self,varargin)
    %NX [INTERNAL] 
    %
    %  int = NX(self)
    %
    %Differential states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_65
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L223
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L197-L199
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1063, self, varargin{:});
    end
    function varargout = nz(self,varargin)
    %NZ [INTERNAL] 
    %
    %  int = NZ(self)
    %
    %Algebraic variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_66
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L228
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L201-L203
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1064, self, varargin{:});
    end
    function varargout = nq(self,varargin)
    %NQ [INTERNAL] 
    %
    %  int = NQ(self)
    %
    %Quadrature states.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_67
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L233
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L205-L207
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1065, self, varargin{:});
    end
    function varargout = nzero(self,varargin)
    %NZERO [INTERNAL] 
    %
    %  int = NZERO(self)
    %
    %Zero-crossing functions.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2cb
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L238
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L209-L211
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1066, self, varargin{:});
    end
    function varargout = ny(self,varargin)
    %NY [INTERNAL] 
    %
    %  int = NY(self)
    %
    % Output variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_68
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L243
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L213-L215
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1067, self, varargin{:});
    end
    function varargout = nu(self,varargin)
    %NU [INTERNAL] 
    %
    %  int = NU(self)
    %
    %Free controls.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_69
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L248
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L217-L219
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1068, self, varargin{:});
    end
    function varargout = np(self,varargin)
    %NP [INTERNAL] 
    %
    %  int = NP(self)
    %
    %Parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6a
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L253
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L221-L223
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1069, self, varargin{:});
    end
    function varargout = nc(self,varargin)
    %NC [INTERNAL] 
    %
    %  int = NC(self)
    %
    %Named constants.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L258
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L225-L227
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1070, self, varargin{:});
    end
    function varargout = nd(self,varargin)
    %ND [INTERNAL] 
    %
    %  int = ND(self)
    %
    %Dependent parameters.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6c
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L263
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L229-L231
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1071, self, varargin{:});
    end
    function varargout = nw(self,varargin)
    %NW [INTERNAL] 
    %
    %  int = NW(self)
    %
    %Dependent variables.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L268
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L233-L235
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1072, self, varargin{:});
    end
    function varargout = add(self,varargin)
    %ADD [INTERNAL] 
    %
    %  MX = ADD(self, char name, struct opts)
    %  MX = ADD(self, char name, char causality, struct opts)
    %  MX = ADD(self, char name, char causality, char variability, struct opts)
    %  ADD(self, char name, char causality, char variability, MX expr, struct opts)
    %
    %Add a new model variable, symbolic expression already available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L292
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L596-L609
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD(self, char name, char causality, char variability, MX expr, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, symbolic expression already available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L292
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L596-L609
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ADD(self, char name, char causality, char variability, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L277
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L567-L576
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ADD(self, char name, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, default variability and causality.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L288
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L587-L594
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ADD(self, char name, char causality, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a new model variable, default variability.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L283
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L578-L585
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1073, self, varargin{:});
    end
    function varargout = eq(self,varargin)
    %EQ [INTERNAL] 
    %
    %  EQ(self, MX lhs, MX rhs, struct opts)
    %
    %Add a simple equation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L338
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L675-L681
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1074, self, varargin{:});
    end
    function varargout = when(self,varargin)
    %WHEN [INTERNAL] 
    %
    %  WHEN(self, MX cond, {char} eqs, struct opts)
    %
    %Add when equations.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L341
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L683-L689
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1075, self, varargin{:});
    end
    function varargout = assign(self,varargin)
    %ASSIGN [INTERNAL] 
    %
    %  char = ASSIGN(self, char name, MX val)
    %
    %Assignment inside a when-equation or if-else equation.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L344
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L691-L698
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1076, self, varargin{:});
    end
    function varargout = reinit(self,varargin)
    %REINIT [INTERNAL] 
    %
    %  char = REINIT(self, char name, MX val)
    %
    %Reinitialize a state inside when-equations.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L347
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L700-L707
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1077, self, varargin{:});
    end
    function varargout = set_init(self,varargin)
    %SET_INIT [INTERNAL] 
    %
    %  SET_INIT(self, char name, MX init_rhs)
    %
    %Specify the initial equation for a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L350
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L709-L715
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1078, self, varargin{:});
    end
    function varargout = sanity_check(self,varargin)
    %SANITY_CHECK [INTERNAL] 
    %
    %  SANITY_CHECK(self)
    %
    %Check if dimensions match.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L378
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L717-L723
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1079, self, varargin{:});
    end
    function varargout = reorder(self,varargin)
    %REORDER [INTERNAL] 
    %
    %  REORDER(self, char cat, {char} v)
    %
    %Reorder variables in a category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L382
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L552-L565
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1080, self, varargin{:});
    end
    function varargout = eliminate(self,varargin)
    %ELIMINATE [INTERNAL] 
    %
    %  ELIMINATE(self, char cat)
    %
    %Eliminate all dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L433
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L820-L826
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1081, self, varargin{:});
    end
    function varargout = sort(self,varargin)
    %SORT [INTERNAL] 
    %
    %  SORT(self, char cat)
    %
    %Sort dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L436
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L828-L834
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1082, self, varargin{:});
    end
    function varargout = lift(self,varargin)
    %LIFT [INTERNAL] 
    %
    %  LIFT(self, bool lift_shared, bool lift_calls)
    %
    %Lift problem formulation by extracting shared subexpressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L439
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L836-L842
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1083, self, varargin{:});
    end
    function varargout = prune(self,varargin)
    %PRUNE [INTERNAL] 
    %
    %  PRUNE(self, bool prune_p, bool prune_u)
    %
    %Prune unused controls.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L442
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L263-L269
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1084, self, varargin{:});
    end
    function varargout = tear(self,varargin)
    %TEAR [INTERNAL] 
    %
    %  TEAR(self)
    %
    %Identify iteration variables and residual equations using naming
    % 
    %convention.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L445
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L271-L277
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1085, self, varargin{:});
    end
    function varargout = add_fun(self,varargin)
    %ADD_FUN [INTERNAL] 
    %
    %  Function = ADD_FUN(self, Function f)
    %  Function = ADD_FUN(self, char name, Importer compiler, struct opts)
    %  Function = ADD_FUN(self, char name, {char} arg, {char} res, struct opts)
    %
    %Add an external function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1090-L1093
    %
    %
    %
    %.......
    %
    %::
    %
    %  ADD_FUN(self, Function f)
    %
    %
    %
    %[INTERNAL] 
    %Add an already existing function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L459
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1071-L1078
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ADD_FUN(self, char name, {char} arg, {char} res, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add a function from loaded expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L454
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1080-L1088
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ADD_FUN(self, char name, Importer compiler, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Add an external function.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L462
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1090-L1093
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1086, self, varargin{:});
    end
    function varargout = has_fun(self,varargin)
    %HAS_FUN [INTERNAL] 
    %
    %  bool = HAS_FUN(self, char name)
    %
    %Does a particular function already exist?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L466
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1095-L1102
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1087, self, varargin{:});
    end
    function varargout = fun(self,varargin)
    %FUN [INTERNAL] 
    %
    %  {Function} = FUN(self)
    %  Function = FUN(self, char name)
    %
    %Get all functions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L472
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1134-L1136
    %
    %
    %
    %.......
    %
    %::
    %
    %  FUN(self, char name)
    %
    %
    %
    %[INTERNAL] 
    %Get function by name.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L469
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1104-L1111
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  FUN(self)
    %
    %
    %
    %[INTERNAL] 
    %Get all functions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L472
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1134-L1136
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1088, self, varargin{:});
    end
    function varargout = gather_fun(self,varargin)
    %GATHER_FUN [INTERNAL] 
    %
    %  GATHER_FUN(self, int max_depth)
    %
    %Collect embedded functions from the expression graph.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L475
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1113-L1132
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1089, self, varargin{:});
    end
    function varargout = parse_fmi(self,varargin)
    %PARSE_FMI [INTERNAL] 
    %
    %  PARSE_FMI(self, char filename)
    %
    %Import existing problem from FMI/XML
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L482
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L482-L482
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1090, self, varargin{:});
    end
    function varargout = provides_directional_derivatives(self,varargin)
    %PROVIDES_DIRECTIONAL_DERIVATIVES [INTERNAL] 
    %
    %  bool = PROVIDES_DIRECTIONAL_DERIVATIVES(self)
    %
    %Does the FMU provide support for analytic derivatives.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L485
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L245-L253
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1091, self, varargin{:});
    end
    function varargout = provides_directional_derivative(self,varargin)
    %PROVIDES_DIRECTIONAL_DERIVATIVE [INTERNAL] 
    %
    %  bool = PROVIDES_DIRECTIONAL_DERIVATIVE(self)
    %
    %Does the FMU provide support for analytic derivatives (FMI 2 
    %naming)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L488
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L488-L488
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1092, self, varargin{:});
    end
    function varargout = load_fmi_description(self,varargin)
    %LOAD_FMI_DESCRIPTION [INTERNAL] 
    %
    %  LOAD_FMI_DESCRIPTION(self, char filename)
    %
    %Import problem description from FMI or XML.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L491
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L237-L243
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1093, self, varargin{:});
    end
    function varargout = export_fmu(self,varargin)
    %EXPORT_FMU [INTERNAL] 
    %
    %  {char} = EXPORT_FMU(self, struct opts)
    %
    %Export instance into an FMU.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L494
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L255-L261
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1094, self, varargin{:});
    end
    function varargout = add_lc(self,varargin)
    %ADD_LC [INTERNAL] 
    %
    %  ADD_LC(self, char name, {char} f_out)
    %
    %Add a named linear combination of output expressions.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L497
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1031-L1038
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1095, self, varargin{:});
    end
    function varargout = create(self,varargin)
    %CREATE [INTERNAL] 
    %
    %  Function = CREATE(self)
    %  Function = CREATE(self, char fname, struct opts)
    %  Function = CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %  Function = CREATE(self, char fname, {char} name_in, {char} name_out, bool sx, bool lifted_calls)
    %
    %Create a function with standard integrator DAE signature, 
    %default 
    %naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L529
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L529-L529
    %
    %
    %
    %.......
    %
    %::
    %
    %  CREATE(self, char name, {char} name_in, {char} name_out, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function object, names provided.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting function object
    %
    %name_in: 
    %Names of all the inputs
    %
    %name_out: 
    %Names of all the outputs
    %
    %opts: 
    %Optional settings
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L512
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1051-L1060
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  CREATE(self, char fname, {char} name_in, {char} name_out, bool sx, bool lifted_calls)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function object, legacy syntax.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L500
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1040-L1049
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  CREATE(self)
    %
    %
    %
    %[INTERNAL] 
    %Create a function with standard integrator DAE signature, 
    %default 
    %naming.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c1
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L529
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L529-L529
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  CREATE(self, char fname, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Create a function with standard integrator DAE signature.
    %
    %Parameters:
    %-----------
    %
    %name: 
    %Name assigned to the resulting function object
    %
    %opts: 
    %Optional settings
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c0
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L524
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1062-L1069
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1096, self, varargin{:});
    end
    function varargout = dependent_fun(self,varargin)
    %DEPENDENT_FUN [INTERNAL] 
    %
    %  Function = DEPENDENT_FUN(self, char fname, {char} s_in, {char} s_out)
    %
    %Construct a function for evaluating dependent parameters.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L532
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1147-L1156
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1097, self, varargin{:});
    end
    function varargout = transition(self,varargin)
    %TRANSITION [INTERNAL] 
    %
    %  Function = TRANSITION(self)
    %  Function = TRANSITION(self, char fname)
    %  Function = TRANSITION(self, char fname, int index)
    %
    %Construct an event transition function, default naming.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L543
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L543-L543
    %
    %
    %
    %.......
    %
    %::
    %
    %  TRANSITION(self)
    %
    %
    %
    %[INTERNAL] 
    %Construct an event transition function, default naming.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L543
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L543-L543
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  TRANSITION(self, char fname)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function describing transition at any events.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L540
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1167-L1174
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  TRANSITION(self, char fname, int index)
    %
    %
    %
    %[INTERNAL] 
    %Construct a function describing transition at a specific events.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L537
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1158-L1165
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1098, self, varargin{:});
    end
    function varargout = var(self,varargin)
    %VAR [INTERNAL] 
    %
    %  MX = VAR(self, char name)
    %
    %Get variable expression by name
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L547
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L725-L732
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1099, self, varargin{:});
    end
    function varargout = paren(self,varargin)
    %PAREN 
    %
    %  MX = PAREN(self, char name)
    %
    %
      [varargout{1:nargout}] = casadiMEX(1100, self, varargin{:});
    end
    function varargout = der(self,varargin)
    %DER [INTERNAL] 
    %
    %  {char} = DER(self, {char} name)
    %  MX = DER(self, MX v)
    %  MX = DER(self, MX v)
    %
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L557
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1197-L1204
    %
    %
    %
    %.......
    %
    %::
    %
    %  DER(self, {char} name)
    %
    %
    %
    %[INTERNAL] 
    %Get the time derivative of model variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L552
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L779-L788
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  DER(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L557
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1197-L1204
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  DER(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Differentiate an expression with respect to time
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L556
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1188-L1195
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1101, self, varargin{:});
    end
    function varargout = pre(self,varargin)
    %PRE [INTERNAL] 
    %
    %  {char} = PRE(self, {char} name)
    %  MX = PRE(self, MX v)
    %
    %Get the pre-expression given variable expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L564
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L764-L777
    %
    %
    %
    %.......
    %
    %::
    %
    %  PRE(self, MX v)
    %
    %
    %
    %[INTERNAL] 
    %Get the pre-expression given variable expression.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L564
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L764-L777
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  PRE(self, {char} name)
    %
    %
    %
    %[INTERNAL] 
    %Get the pre-variables of model variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L561
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L790-L799
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1102, self, varargin{:});
    end
    function varargout = has_beq(self,varargin)
    %HAS_BEQ [INTERNAL] 
    %
    %  bool = HAS_BEQ(self, char name)
    %
    %Does a variable have a binding equation?
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L567
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L801-L808
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1103, self, varargin{:});
    end
    function varargout = beq(self,varargin)
    %BEQ [INTERNAL] 
    %
    %  MX = BEQ(self, char name)
    %
    %Get the binding equation for a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L570
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L810-L818
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1104, self, varargin{:});
    end
    function varargout = value_reference(self,varargin)
    %VALUE_REFERENCE [INTERNAL] 
    %
    %  int = VALUE_REFERENCE(self, char name)
    %
    %Get/set value reference
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L574
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L844-L846
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1105, self, varargin{:});
    end
    function varargout = set_value_reference(self,varargin)
    %SET_VALUE_REFERENCE [INTERNAL] 
    %
    %  SET_VALUE_REFERENCE(self, char name, int val)
    %
    %Get/set value reference
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L575
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L848-L850
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1106, self, varargin{:});
    end
    function varargout = description(self,varargin)
    %DESCRIPTION [INTERNAL] 
    %
    %  char = DESCRIPTION(self, char name)
    %
    %Get/set description
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L580
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L852-L854
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1107, self, varargin{:});
    end
    function varargout = set_description(self,varargin)
    %SET_DESCRIPTION [INTERNAL] 
    %
    %  SET_DESCRIPTION(self, char name, char val)
    %
    %Get/set description
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L581
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L856-L858
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1108, self, varargin{:});
    end
    function varargout = type(self,varargin)
    %TYPE [INTERNAL] 
    %
    %  char = TYPE(self, char name, int fmi_version)
    %
    %Get/set the type
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L586
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L860-L869
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1109, self, varargin{:});
    end
    function varargout = set_type(self,varargin)
    %SET_TYPE [INTERNAL] 
    %
    %  SET_TYPE(self, char name, char val)
    %
    %Get/set the type
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L587
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L871-L878
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1110, self, varargin{:});
    end
    function varargout = causality(self,varargin)
    %CAUSALITY [INTERNAL] 
    %
    %  char = CAUSALITY(self, char name)
    %
    %Get the causality.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L591
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L880-L887
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1111, self, varargin{:});
    end
    function varargout = set_causality(self,varargin)
    %SET_CAUSALITY [INTERNAL] 
    %
    %  SET_CAUSALITY(self, char name, char val)
    %
    %Set the causality, if permitted.
    %
    %The following changes are permitted: For controls 'u' (variability 
    %
    %'continuous', causality 'input'), free parameters 'p' (variability 
    %
    %'tunable', causality 'parameter') and fixed parameters 'c' 
    %(variability 
    %'fixed', causality 'parameter'), causality can only be 
    %changed indirectly, 
    %by updating the variability Add or remove an 
    %output 'y' by setting the 
    %causality to 'output' or 'local', 
    %respectively
    %
    %No other changes are permitted.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L606
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L889-L895
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1112, self, varargin{:});
    end
    function varargout = variability(self,varargin)
    %VARIABILITY [INTERNAL] 
    %
    %  char = VARIABILITY(self, char name)
    %
    %Get the variability.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L609
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L897-L904
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1113, self, varargin{:});
    end
    function varargout = set_variability(self,varargin)
    %SET_VARIABILITY [INTERNAL] 
    %
    %  SET_VARIABILITY(self, char name, char val)
    %
    %Set the variability, if permitted.
    %
    %For controls 'u' (variability 'continuous', causality 'input'), free 
    %
    %parameters 'p' (variability 'tunable', causality 'parameter') and 
    %fixed 
    %parameters 'c' (variability 'fixed', causality 'parameter'), 
    %update 
    %variability in order to change the category. Causality is 
    %updated 
    %accordingly.
    %
    %Other changes are not permitted
    %
    %::
    %
    %  Extra doc: https://github.com/casadi/casadi/wiki/L_2c3 
    %  
    %
    %
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L621
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L906-L912
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1114, self, varargin{:});
    end
    function varargout = category(self,varargin)
    %CATEGORY [INTERNAL] 
    %
    %  char = CATEGORY(self, char name)
    %
    %Get the variable category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L624
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L914-L921
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1115, self, varargin{:});
    end
    function varargout = set_category(self,varargin)
    %SET_CATEGORY [INTERNAL] 
    %
    %  SET_CATEGORY(self, char name, char val)
    %
    %Set the variable category, if permitted.
    %
    %The following changes are permitted: Controls 'u' can be changed 
    %to/from 
    %tunable parameters 'p' or fixed parameters 'c' Differential 
    %states that do 
    %not appear in the right-hand-sides can be changed 
    %between regular states 
    %'x' and quadrature states 'q'
    %
    %Other changes are not permitted. Causality and variability is updated 
    %
    %accordingly.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_2c4
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L636
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L923-L929
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1116, self, varargin{:});
    end
    function varargout = initial(self,varargin)
    %INITIAL [INTERNAL] 
    %
    %  char = INITIAL(self, char name)
    %
    %Get/set the initial property
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L640
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L931-L933
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1117, self, varargin{:});
    end
    function varargout = set_initial(self,varargin)
    %SET_INITIAL [INTERNAL] 
    %
    %  SET_INITIAL(self, char name, char val)
    %
    %Get/set the initial property
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L641
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L935-L937
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1118, self, varargin{:});
    end
    function varargout = unit(self,varargin)
    %UNIT [INTERNAL] 
    %
    %  char = UNIT(self, char name)
    %
    %Get/set the unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L646
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L939-L941
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1119, self, varargin{:});
    end
    function varargout = set_unit(self,varargin)
    %SET_UNIT [INTERNAL] 
    %
    %  SET_UNIT(self, char name, char val)
    %
    %Get/set the unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L647
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L943-L945
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1120, self, varargin{:});
    end
    function varargout = display_unit(self,varargin)
    %DISPLAY_UNIT [INTERNAL] 
    %
    %  char = DISPLAY_UNIT(self, char name)
    %
    %Get/set the display unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L652
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L947-L949
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1121, self, varargin{:});
    end
    function varargout = set_display_unit(self,varargin)
    %SET_DISPLAY_UNIT [INTERNAL] 
    %
    %  SET_DISPLAY_UNIT(self, char name, char val)
    %
    %Get/set the display unit
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L653
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L951-L953
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1122, self, varargin{:});
    end
    function varargout = numel(self,varargin)
    %NUMEL [INTERNAL] 
    %
    %  int = NUMEL(self, char name)
    %
    %Get the number of elements of a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L657
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L955-L957
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1123, self, varargin{:});
    end
    function varargout = dimension(self,varargin)
    %DIMENSION [INTERNAL] 
    %
    %  [int] = DIMENSION(self, char name)
    %
    %Get the dimensions of a variable.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L660
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L959-L961
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1124, self, varargin{:});
    end
    function varargout = start_time(self,varargin)
    %START_TIME [INTERNAL] 
    %
    %  double = START_TIME(self)
    %
    %Get the start time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L663
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L963-L970
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1125, self, varargin{:});
    end
    function varargout = set_start_time(self,varargin)
    %SET_START_TIME [INTERNAL] 
    %
    %  SET_START_TIME(self, double val)
    %
    %Set the start time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L666
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L972-L978
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1126, self, varargin{:});
    end
    function varargout = stop_time(self,varargin)
    %STOP_TIME [INTERNAL] 
    %
    %  double = STOP_TIME(self)
    %
    %Get the stop time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L669
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L980-L987
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1127, self, varargin{:});
    end
    function varargout = set_stop_time(self,varargin)
    %SET_STOP_TIME [INTERNAL] 
    %
    %  SET_STOP_TIME(self, double val)
    %
    %Set the stop time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L672
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L989-L995
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1128, self, varargin{:});
    end
    function varargout = tolerance(self,varargin)
    %TOLERANCE [INTERNAL] 
    %
    %  double = TOLERANCE(self)
    %
    %Get the tolerance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L675
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L997-L1004
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1129, self, varargin{:});
    end
    function varargout = set_tolerance(self,varargin)
    %SET_TOLERANCE [INTERNAL] 
    %
    %  SET_TOLERANCE(self, double val)
    %
    %Set the tolerance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L678
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1006-L1012
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1130, self, varargin{:});
    end
    function varargout = step_size(self,varargin)
    %STEP_SIZE [INTERNAL] 
    %
    %  double = STEP_SIZE(self)
    %
    %Get the step size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L681
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1014-L1021
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1131, self, varargin{:});
    end
    function varargout = set_step_size(self,varargin)
    %SET_STEP_SIZE [INTERNAL] 
    %
    %  SET_STEP_SIZE(self, double val)
    %
    %Set the step size.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L684
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1023-L1029
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1132, self, varargin{:});
    end
    function varargout = attribute(self,varargin)
    %ATTRIBUTE [INTERNAL] 
    %
    %  [double] = ATTRIBUTE(self, char a, {char} name)
    %
    %Get an attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L743
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1215-L1223
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1133, self, varargin{:});
    end
    function varargout = set_attribute(self,varargin)
    %SET_ATTRIBUTE [INTERNAL] 
    %
    %  SET_ATTRIBUTE(self, char a, {char} name, [double] val)
    %
    %Set an attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L746
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1233-L1240
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1134, self, varargin{:});
    end
    function varargout = min(self,varargin)
    %MIN [INTERNAL] 
    %
    %  [double] = MIN(self, {char} name)
    %
    %Get the lower bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L750
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1251-L1258
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1135, self, varargin{:});
    end
    function varargout = set_min(self,varargin)
    %SET_MIN [INTERNAL] 
    %
    %  SET_MIN(self, {char} name, [double] val)
    %
    %Set the lower bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L753
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1268-L1274
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1136, self, varargin{:});
    end
    function varargout = max(self,varargin)
    %MAX [INTERNAL] 
    %
    %  [double] = MAX(self, {char} name)
    %
    %Get the upper bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L756
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1285-L1292
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1137, self, varargin{:});
    end
    function varargout = set_max(self,varargin)
    %SET_MAX [INTERNAL] 
    %
    %  SET_MAX(self, {char} name, [double] val)
    %
    %Set the upper bound.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L759
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1302-L1308
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1138, self, varargin{:});
    end
    function varargout = nominal(self,varargin)
    %NOMINAL [INTERNAL] 
    %
    %  [double] = NOMINAL(self, {char} name)
    %
    %Get the nominal value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L762
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1319-L1326
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1139, self, varargin{:});
    end
    function varargout = set_nominal(self,varargin)
    %SET_NOMINAL [INTERNAL] 
    %
    %  SET_NOMINAL(self, {char} name, [double] val)
    %
    %Set the nominal value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L765
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1336-L1342
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1140, self, varargin{:});
    end
    function varargout = start(self,varargin)
    %START [INTERNAL] 
    %
    %  [double] = START(self, {char} name)
    %
    %Get the start attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L768
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1353-L1360
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1141, self, varargin{:});
    end
    function varargout = set_start(self,varargin)
    %SET_START [INTERNAL] 
    %
    %  SET_START(self, {char} name, [double] val)
    %
    %Set the start attribute.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L771
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1378-L1384
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1142, self, varargin{:});
    end
    function varargout = set(self,varargin)
    %SET [INTERNAL] 
    %
    %  SET(self, {char} name, [double] val)
    %  SET(self, {char} name, {char} val)
    %
    %Set the current value (string)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L777
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1418-L1425
    %
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, {char} name, {char} val)
    %
    %
    %
    %[INTERNAL] 
    %Set the current value (string)
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L777
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1418-L1425
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  SET(self, {char} name, [double] val)
    %
    %
    %
    %[INTERNAL] 
    %Set the current value.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L774
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1410-L1416
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1143, self, varargin{:});
    end
    function varargout = get(self,varargin)
    %GET [INTERNAL] 
    %
    %  {GenericType} = GET(self, {char} name)
    %
    %Evaluate the values for a set of variables at the initial time.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L780
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1431-L1446
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1144, self, varargin{:});
    end
    function varargout = has(self,varargin)
    %HAS [INTERNAL] 
    %
    %  bool = HAS(self, char name)
    %
    %Check if a particular variable exists.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L783
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L279-L286
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1145, self, varargin{:});
    end
    function varargout = all(self,varargin)
    %ALL [INTERNAL] 
    %
    %  {char} = ALL(self)
    %  {char} = ALL(self, char cat)
    %
    %Get a list of all variables of a particular category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L789
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L297-L304
    %
    %
    %
    %.......
    %
    %::
    %
    %  ALL(self)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all variables.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L786
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L288-L295
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  ALL(self, char cat)
    %
    %
    %
    %[INTERNAL] 
    %Get a list of all variables of a particular category.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L789
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L297-L304
    %
    %
    %
    %.............
    %
    %
      [varargout{1:nargout}] = casadiMEX(1146, self, varargin{:});
    end
    function varargout = oracle(self,varargin)
    %ORACLE [INTERNAL] 
    %
    %  Function = ORACLE(self, bool sx, bool elim_w, bool lifted_calls)
    %
    %Get the (cached) oracle, SX or  MX.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L818
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1138-L1145
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1147, self, varargin{:});
    end
    function varargout = jac_sparsity(self,varargin)
    %JAC_SPARSITY [INTERNAL] 
    %
    %  Sparsity = JAC_SPARSITY(self, {char} onames, {char} inames)
    %
    %Get Jacobian sparsity.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_6g
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L823
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L1448-L1456
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1148, self, varargin{:});
    end
    function self = DaeBuilder(varargin)
    %DAEBUILDER 
    %
    %  new_obj = DAEBUILDER()
    %  new_obj = DAEBUILDER(char name, char path, struct opts)
    %
    %
    %.......
    %
    %::
    %
    %  DAEBUILDER(char name, char path, struct opts)
    %
    %
    %
    %[INTERNAL] 
    %Construct a  DaeBuilder instance.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L80
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L54-L57
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  DAEBUILDER()
    %
    %
    %
    %[INTERNAL] 
    %Default constructor.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.hpp#L77
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dae_builder.cpp#L51-L52
    %
    %
    %
    %.............
    %
    %
      self@casadi.SharedObject(SwigRef.Null);
      self@casadi.PrintableCommon(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1149, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1150, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
