function y = TMPC(count, dt, taus, pos, vel)
% clear all

% count = 4;
% taus = [0.51,0.6,0.55,0.49];
% pos = [200,195,175,162];
% vel = [22.2,20,25,21];

% count = 3;
% taus = [0.51,0.6,0.55];
% pos = [200,195,175];
% vel = [22.2,20,25];

% Vehicle Class Implementation
% MATLAB doesn't have native classes in scripts, so we use structs
vehicle_template = struct(...
    'A', [],...
    'B', [],...
    'Ad', [],...
    'Bd', [],...
    'x0', [],...
    'x1', [],...
    'States', []);

Number_of_agent = count;
Ts = dt;
N = 20;
% Initialize vehicle array
vehicles = repmat(vehicle_template, 1, Number_of_agent);

% Leader vehicle parameters
% tau = 0.51;
% initial_pos = 220;
% initial_vel = 22;
addpath('C:\Users\nishk\Documents\Cudding\BTP-Tests\Platoon-Simulation\casadi-3.7.0-windows64-matlab2018b')
import casadi.*

for i = 1:Number_of_agent
    % Shared parameters for example (modify as needed)
    vehicles(i).A = [0 1 0; 0 0 1; 0 0 -1/taus(i)];
    vehicles(i).B = [0; 0; 1/taus(i)];
    
    % Continuous-time system
    sys_cont = ss(vehicles(i).A, vehicles(i).B, eye(3), zeros(3,1));
    
    % Discrete-time system
    sys_disc = c2d(sys_cont, Ts);
    vehicles(i).Ad = sys_disc.A;
    vehicles(i).Bd = sys_disc.B;
    
    % Initial states
    vehicles(i).x0 = [pos(i); vel(i); 0];
    vehicles(i).x1 = [0; 0; 0];
end

% Symbolic Variables Setup
states = [];
controls = [];

for i = 1:Number_of_agent
    states = [states; 
        SX.sym(sprintf('x%d',i));
        SX.sym(sprintf('x_dot%d',i));
        SX.sym(sprintf('x_ddot%d',i))];
    
    controls = [controls; 
        SX.sym(sprintf('tau%d',i))];
end

n_states = length(states);
n_controls = length(controls);

% Reference Generation
Ref_states = vehicles(1).x0;
x__ = vehicles(1).x0;

% Propagate reference trajectory
for k = 1:N
    x_ = vehicles(1).Ad * x__ + vehicles(1).Bd * 0;
    x__ = x_;
    Ref_states = [Ref_states, x__];
end

Temp = Ref_states;
for i=1:Number_of_agent-1  
    Temp2 = Temp - [10*i;0;0];
    Ref_states= [Ref_states;Temp2];
end

% Block Diagonal Matrices
Ad_list = {vehicles.Ad};
Bd_list = {vehicles.Bd};
A_main = blkdiag(Ad_list{:});
B_main = blkdiag(Bd_list{:});


%%% Define Parameters for Solver 
U = SX.sym('U',n_controls,N); 
P = SX.sym('P',n_states + N*(n_states)+ Number_of_agent*2 - 2);
X = SX.sym('X',n_states,(N+1));

% compute solution symbolically
X(:,1) = P(1:n_states); % initial state
for k = 1:N
    st = X(:,k);  con = U(:,k);
    st_next  = A_main*st+ B_main*con;
    X(:,k+1) = st_next;
end

ff=Function('ff',{U,P},{X});


obj = 0; 
g = [];  

Q_ = [10,0,0;0,4,0;0,0,1];
R_ =  1;
Q_cell = repmat({Q_}, 1, Number_of_agent);
R_cell = repmat({R_}, 1, Number_of_agent);
Q = blkdiag(Q_cell{:});
R = blkdiag(R_cell{:});
% Q = blkdiag(Q_,Q_,Q_,Q_);
% R = blkdiag(R_,R_,R_,R_);

D = [];
L = [];

for i = 1:Number_of_agent-1
    D = [D; 10];
    L = [L; 10*i];
end

st  = X(:,1); 
for k = 1:N
    st = X(:,k);  con = U(:,k);
    obj = obj+(st-P((Number_of_agent*3*k)+1:((Number_of_agent*3)*(k+1))))'*Q*(st-P(((Number_of_agent*3)*k)+1:((Number_of_agent*3)*(k+1)))) + (con)'* R *(con) ; % calculate obj
    for i = 0:(Number_of_agent-2)
        obj = obj + 80*(st((3*i)+1)-st((3*(i+1)+1))-P(n_states + N*(n_states)+1+i))^2;
    end
    for i = 0:(Number_of_agent-2)
        obj = obj + (st((3*i)+2)-st((3*(i+1)+2)))^2;
    end
    for i = 0:(Number_of_agent-2)
        obj = obj + (st((3*i)+3)-st((3*(i+1)+3)))^2;
    end
    for i= 1:(Number_of_agent-1)
        obj = obj + (st(1)-st((3*i)+1)-P(n_states + N*(n_states)+1 + Number_of_agent-2+i))^2;
    end
    for i= 1:(Number_of_agent-1)
        obj = obj + (st(2)-st((3*i)+2))^2;
    end
    for i= 1:(Number_of_agent-1)
        obj = obj + (st(3)-st((3*i)+3))^2;
    end 
end



% compute constraints
for k = 1:N+1   % box constraints due to the map margins
    for j = 1: Number_of_agent
        g = [g ; X(3*j-1,k)];   
        g = [g ; X(3*j,k)]; 
        % g = [g ; X(5,k)];   
        % g = [g ; X(6,k)]; 
        % g = [g ; X(8,k)];   
        % g = [g ; X(9,k)]; 
        % g = [g ; X(11,k)];   
        % g = [g ; X(12,k)]; 
    end
end



% make the decision variables one column vector
OPT_variables = reshape(U,N*Number_of_agent,1);
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 100;
opts.ipopt.print_level =0;%0,3
opts.print_time = 0;
opts.ipopt.acceptable_tol =1e-8;
opts.ipopt.acceptable_obj_change_tol = 1e-6;

solver = nlpsol('solver', 'ipopt', nlp_prob,opts);


args = struct;


Temp3 = [0;-10];
args.lbg = repmat(Temp3,(Number_of_agent)*(N+1),1);
Temp3 = [27.7;10];
args.ubg = repmat(Temp3,(Number_of_agent)*(N+1),1);

Temp3 = [];
for i = 1:Number_of_agent
    Temp3 = [Temp3; -15];
end
Temper_A = repmat(Temp3,N,1);
args.lbx(1:Number_of_agent*N) = Temper_A;
Temp3 = [];
for i = 1:Number_of_agent
    Temp3 = [Temp3; 10];
end
Temper_A = repmat(Temp3,N,1);
args.ubx(1:Number_of_agent*N) = Temper_A;

t0 = 0;
Leadr.x0 = [ 200 ; 22.2 ; 0];
% x0 = [Leader.x0;Follower1.x0;Follower2.x0;Follower3.x0];    % initial condition.
x0 = [];
for i = 1:Number_of_agent
    x0 = [x0; vehicles(i).x0];
end

xx(:,1) = x0; % xx contains the history of states
t(1) = t0;

u0 = zeros(N,Number_of_agent);        % two control inputs for each robot
X0 = repmat(x0,1,N+1)'; % initialization of the states decision variables

sim_tim = 10; % Maximum simulation time

% Start MPC
mpciter = 0;
xx1 = [];
u_cl=[];
main_loop = tic;
U_final_ =[];
delta_u = [];
u_back = 0 ;

while(mpciter < 1)
% while(mpciter < sim_tim/Ts) % new - condition for ending the loop
    % args.p   = [x0;xs]; % set the values of the parameters vector
    %----------------------------------------------------------------------
    args.p(1:(Number_of_agent*3)) = x0; % initial condition of the robot posture
    for k = 1:N %new - set the reference to track
        args.p(((Number_of_agent*3)*k)+1:((Number_of_agent*3)*(k+1))) = Ref_states(:,k);   
    end
   % D = [8;8;8];
   % L = [ 8 ; 16 ; 24];
    args.p((Number_of_agent*3)*(N+1)+1:((Number_of_agent*3)*(N+1)+1)+((Number_of_agent-1)*2 -1))=[D',L'];
    %----------------------------------------------------------------------    
    % initial value of the optimization variables
    args.x0  = [reshape(u0',(Number_of_agent)*N,1)];

    Temp33 = [];
    Temp34 = [];

    for i = 1:Number_of_agent
        v_lim = x0(3*i - 1);
        a_lim = x0(3*i);

        % Calculate control input bounds for this agent
        lim_u = (0.5*1*2.2*0.35*v_lim^2 + 150 + 0.5*1*2.2*0.35*v_lim*a_lim)/1500;

        % Append to constraint vectors
        Temp33 = [Temp33; -10 - lim_u];
        Temp34 = [Temp34; 5 - lim_u];
    end
             % v1_lim = x0(2);
             % v2_lim = x0(5);
             % v3_lim = x0(8);
             % v4_lim = x0(11);
             % 
             % a1_lim = x0(3);
             % a2_lim = x0(6);
             % a3_lim = x0(9);
             % a4_lim = x0(12);
             % 
             % lim_u_1 = (0.5*1*2.2*0.35*v1_lim^2 + 150 + 0.5 *1*2.2*0.35*v1_lim*a1_lim)/1500;
             % lim_u_2 = (0.5*1*2.2*0.35*v2_lim^2 + 150 + 0.5 *1*2.2*0.35*v2_lim*a2_lim)/1500;
             % lim_u_3 = (0.5*1*2.2*0.35*v3_lim^2 + 150 + 0.5 *1*2.2*0.35*v3_lim*a3_lim)/1500;
             % lim_u_4 = (0.5*1*2.2*0.35*v4_lim^2 + 150 + 0.5 *1*2.2*0.35*v4_lim*a4_lim)/1500;
             % Temp33 = [ -10-lim_u_1 ; -10-lim_u_2; -10-lim_u_3; -10-lim_u_4];
             % Temp34 = [5-lim_u_1;5-lim_u_2;5-lim_u_3;5-lim_u_4];



     Temper_A = repmat(Temp33,N,1);
     args.lbx(1:Number_of_agent*N) = Temper_A;
     Temper_A = repmat(Temp34,N,1);
     args.ubx(1:Number_of_agent*N) = Temper_A;



    sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx,...
            'lbg', args.lbg, 'ubg', args.ubg,'p',args.p);
    u = reshape(full(sol.x)',Number_of_agent,N); % get controls only from the solution

    t(mpciter+1) = t0;

    % Apply the control and shift the solution

    t0 = t0 + Ts;
    U_final = u(:,1);


    u_cl= [u_cl, U_final];
    u_cl;
    X___ = A_main*x0 + B_main*U_final;
    u0 = [u(2:size(u,1),:);u(size(u,1),:)];
    x0 = full(X___);
    %%%%%%%


    %%%%%%%


    xx(:,mpciter+2) = x0;
    mpciter;
    mpciter = mpciter + 1;

    Ref_states = [vehicles(1).x0];
    x__ = vehicles(1).x0;
    for i=1:N
        x_ = vehicles(1).Ad*x__ + vehicles(1).Bd*0;
        if i ==1
            vehicles(1).x0 = x_;
        end
        x__ = x_;
        Ref_states = [Ref_states,x__];
    end
    Temp = Ref_states;
    for i=1:Number_of_agent-1 
        Temp2 = Temp - [10*i;0;0];
        Ref_states= [Ref_states;Temp2];
    end

end

main_loop_time = toc(main_loop)
% average_mpc_time = main_loop_time/(mpciter-1)


y = u_cl;

% Time = 0:0.1:sim_tim;
% figure 
% p1 = plot(Time,xx(1,:));
% hold on 
% p2 = plot(Time,xx(4,:));
% hold on 
% p3 = plot(Time,xx(7,:));
% hold on 
% p4 = plot(Time,xx(10,:));
% legend('Leader Position','Follower1 Position','Follower2 Position','Follower3 Position');
% title('position')
% ylabel('Position (m)');
% xlabel('Time (S)');
% title('Platoon of 4 Vehicle');
% p1.LineWidth = 2;
% p2.LineWidth = 2;
% p3.LineWidth = 2;
% p4.LineWidth = 2;
% set(gca,'FontSize',12,'FontName','helvetica');
% grid on
% 
% figure 
% p1 = plot(Time,xx(1,:)-xx(4,:));
% hold on 
% p2 = plot(Time,xx(4,:)-xx(7,:));
% hold on 
% p3 = plot(Time,xx(7,:)-xx(10,:));
% hold on 
% legend('Distance Leader and Foolower1 ','Distance Follower1 and Follower2','Distance Follower2 and Follower3');
% 
% ylabel('Distance (m)');
% xlabel('Time (S)');
% title('Platoon of 4 Vehicle');
% p1.LineWidth = 2;
% p2.LineWidth = 2;
% p3.LineWidth = 2;
% set(gca,'FontSize',12,'FontName','helvetica');
% grid on
% 
% 
% 
% figure 
% p1 = plot(Time,xx(2,:));
% hold on 
% p2 = plot(Time,xx(5,:));
% hold on 
% p3 = plot(Time,xx(8,:));
% hold on 
% p4 = plot(Time,xx(11,:));
% hold on 
% legend('Leader Velocity','Follower1 Velocity','Follower2 Velocity','Follower3 Velocity');
% ylabel('Velocity (m/S)');
% xlabel('Time (S)');
% title('Platoon of 4 Vehicle');
% p1.LineWidth = 2;
% p2.LineWidth = 2;
% p3.LineWidth = 2;
% p4.LineWidth = 2;
% set(gca,'FontSize',12,'FontName','helvetica');
% grid on
% 
% figure 
% p1 = plot(Time,xx(3,:));
% hold on 
% p2 = plot(Time,xx(6,:));
% hold on 
% p3= plot(Time,xx(9,:));
% hold on 
% p4 = plot(Time,xx(12,:));
% hold on 
% legend('Leader Acceleration','Follower1 Acceleration','Follower2 Acceleration','Follower3 Acceleration');
% ylabel('Acceleration (m/S^2)');
% xlabel('Time (S)');
% title('Platoon of 4 Vehicle');
% p1.LineWidth = 2;
% p2.LineWidth = 2;
% p3.LineWidth = 2;
% p4.LineWidth = 2;
% set(gca,'FontSize',12,'FontName','helvetica');
% grid on
% 
% 
% Time = 0:0.1:sim_tim-0.1;
% 
% 
% figure 
% p1 = plot(Time,u_cl(1,:));
% hold on 
% p2 = plot(Time,u_cl(2,:));
% hold on 
% p3 = plot(Time,u_cl(3,:));
% hold on 
% p4 = plot(Time,u_cl(4,:));
% hold on 
% legend('Leader Input Signal','Follower1 Input Signal','Follower2 Input Signal','Follower3 Input Signal');
% ylabel('u (m/S^2)');
% xlabel('Time (S)');
% title('Platoon of 4 Vehicle');
% p1.LineWidth = 2;
% p2.LineWidth = 2;
% p3.LineWidth = 2;
% p4.LineWidth = 2;
% set(gca,'FontSize',12,'FontName','helvetica');
% grid on


end