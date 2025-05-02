import time
# import matlab.engine
import matlab
# eng = matlab.engine.start_matlab()
import MPCPkg
pkg = MPCPkg.initialize()

# count = matlab.double(4)
# taus = matlab.double([0.51,0.6,0.55,0.49])
# pos = matlab.double([200,195,175,162])
# vel = matlab.double([22.2,20,25,21])

# u = eng.TMPC(count, taus, pos, vel)
# print(u)

G = [0]
f = 0
Log = []
F = 15
FF = 10
tot = 0
c = 0

tau = 5
Ts  = 1000
tauMPC = 0.51

class Vehicle :
    min_v = 0
    max_v = 30
    max_a = 10
    min_a = -10
    a = 0
    v = 0
    x = 0
    P = None
    i = 0
    st = 0
    aim_a = 0
    aim_x = 0

    def __init__ ( self , x ) :
        self.x = x

    def satisfy ( self ) :
        self.a = max(self.a,self.min_a)
        self.a = min(self.a,self.max_a)
        self.v = max(self.v,self.min_v)
        self.v = min(self.v,self.max_v)
        

    def set_a ( self ) :

        self.aim_x = G[0] - self.i*(F + FF)

        if self.P == None : return

        D  = F

        D +=  max ( ((self.P.v)**2)/(2*self.P.min_a) - ((self.v)**2)/(2*self.min_a) , 0 )
        
        # if f : Log.append( [ self.i , self.x, self.v,self.a ,self.st , abs ( (G[0]-self.x) - (self.i*F) ) , abs( self.P.x - self.x ) ] )

        if ( abs ( (G[0]-self.x) - (self.i*(F +FF)) ) > 0.004 )  or ( abs( self.P.x - self.x ) < F ) :
            self.st = 0

        else :
            #if ( abs ( (G[0]-self.x) - (self.i*F*2) ) < 0.1 ) and ( abs( self.P.x - self.x - F*2 ) < 0.1 ) :
            self.st = 1
            self.a = 0
            self.v = 20
            self.aim_a = 0
        
        if self.st == 0  :

            
            
            if self.P.x - self.x < D :
                #self.a = self.min_a
                self.aim_a = self.min_a

            elif (G[0]-self.x) - (self.i*(F+FF)) > 0.1 :
                #self.a = self.max_a
                self.aim_a = self.max_a

            elif (G[0]-self.x) - (self.i*(F+FF)) < -0.1 :
                #self.a = self.min_a
                self.aim_a = self.min_a
                
            #elif self.P.x - self.x > D :
            #    self.a = self.max_a

    def move_forward_time ( self , t ) :

        # self.set_a()

        
        # self.satisfy()


        #MPC
        # self.a = (1-(tau/Ts))*self.a + (tau/Ts)*self.aim_a
        self.a = self.aim_a

        global c , tot
        if c :
            if tot < 10000 :
                if self.i == 2 :
                    tot += 1
                    self.v = 15
            else :
                c = 0

        if self.min_v <= ( self.v + self.a*t ) <= self.max_v :
            self.x += self.v*t + self.a*t*t/2
            self.v += self.a*t
            return

        if self.max_v < self.v + self.a*t :
            t1 = (self.max_v - self.v)/self.a
            t2 = t - t1
            self.x += self.v*t1 + self.a*t1*t1/2
            self.v = self.max_v
            self.x += self.v*t2
            return
    
        if self.min_v > self.v + self.a*t :
            t1 = (self.min_v - self.v)/self.a
            t2 = t - t1
            self.x += self.v*t1 + self.a*t1*t1/2
            self.v = self.min_v
            self.x += self.v*t2
            return
        
    def print ( self ) :
        if self.P == None : self.P = self
        print(self.x,self.v,self.a, abs ( (G[0]-self.x) - (self.i*F) ) , abs( self.P.x - self.x ))
        if self.P == self : self.P = None
A = []
N = 5
V = Vehicle ( 50 )
V.v = 20
V.st= 1
A += [V]
for i in range ( N - 1 ) :
    v = Vehicle(45-5*i)
    
    v.P = A[-1]
    v.v = 0
    v.i = v.P.i + 1
    A += [v]

xv = [0]
x= []
Position = [ [] for a in A ]
PositionError = [ [] for a in A ]
Velocity = [ [] for a in A ]
Acceleration = [ [] for a in A ]


def run_mpc():
    j = 0
    pos = []
    vel = []
    taus = []
    for a in A:
        pos += Position[j][-1]
        vel += Velocity[j][-1]
        taus += tauMPC
        j += 1
    u_cl = pkg.TMPC(matlab.double(N), matlab.double(taus), matlab.double(pos), matlab.double(vel))
    a_mpc = []
    for u in u_cl:
        a_mpc += u
    return a_mpc

def update_Vehicles () :
    start = time.time()
    for i in range ( 1 ) :
        x.append(xv[0])
        xv[0] += 10
        # a_mpc = run_mpc()
        j = 0

        count = matlab.double(len(A))
        dt = matlab.double(0.01)
        taus = matlab.double([0.51]*len(A))
        pos = matlab.double([a.x for a in A])
        vel = matlab.double([a.v for a in A])

        start_mpc = time.time()
        a_des = pkg.LMPC(count, dt, taus, pos, vel)
        end_mpc = time.time()
        print(f"MPC Time taken: {end_mpc-start_mpc:.6f} seconds")
        for i in range(len(A)):
            A[i].aim_a = float(a_des[i][0])


        for a in A :
            a.move_forward_time(0.1)
            Position[j] += [a.aim_x-a.x]
            PositionError[j] += [a.x - A[0].x - a.i*(F+FF)]
            Velocity[j] += [a.v]
            Acceleration[j]+= [a.a]
            j += 1
        G[0] = A[0].x
    end = time.time()
    print(f"Time taken for 10 iterations: {end-start:.6f} seconds")







import cv2
import numpy as np
import time

height = 400
width  = 400

k = 0
M = [ [ 0 for j in range ( width ) ] for i in range ( height ) ]

Default = [ [ 255 for j in range ( width ) ] for i in range ( height ) ]

for j in range ( width ) :
    for i in range ( 150 , 250 ) :
        Default[i][j] = 150

V = []

def add_circle ( x , y , r ) :
    R = r**2
    for i in range ( max(y-r,0) , min(y+r+1,height) ) :
        for j in range ( max(x-r,0) , min(x+r+1,width) ) :
            if (i-y)**2 + (j-x)**2 <= R :
                M[i][j] = 50



def update () :

    update_Vehicles()

    x = max ( width , A[0].x + 20 )
    x = int(x)
    w = x - width
    
    for i in range ( height ) :
        for j in range ( width ) :
            M[i][j] = Default[i][j]

    for j in range ( width ) :
        if ( (j+w) & 64 ) : 
            for i in range ( 190 ,210 ) :
                M[i][j] = 200
        

    for a in A :
        add_circle( int(a.x) - w , height//2 , 2  )
    
    for i in range ( height ) :
        for j in range ( width ) :
            M[i][j] %= 256
     

cv2.namedWindow("Live Matrix", cv2.WINDOW_NORMAL)

iter = 0
while True :
    iter += 1
    update()

    matrix = np.array(M, dtype=np.uint8)

    matrix_bgr = cv2.cvtColor(np.array(matrix), cv2.COLOR_GRAY2BGR)

    cv2.imshow("Live Matrix", matrix_bgr)

    k = cv2.waitKey(2) & 0xFF

    if iter == 250:
        k = ord('j')

    if k == ord('q') : break
    elif k == ord('j'):
        A[1].x -= 5
        f = 1
        print(*[round(a.v,3) for a in A])

    elif k == ord('b'):
        c = 1
        tot = 0
        print(*[round(a.v,3) for a in A])


    elif k == ord('f'):
        for a in A : print( abs ( (G[0]-a.x) - (a.i*F) ) )
        print()

    #print( A[0] )

cv2.destroyAllWindows()

























import matplotlib.pyplot as plt

# Create the plot
j = 0
for y in PositionError :  
    if j == 0:
        lab = "Leader"
    else:
        lab = f"Follower {j}"
    j += 1
    plt.plot(x, y, label=lab)  # Line 1

# Add title and labels
plt.title("String Stability test")
plt.xlabel("Time (ms) ")
plt.ylabel("Position Error (m)")
 
# Add a legend
plt.legend(loc = 1)

# Display the plot
plt.show()

# Create the plot
j = 0
for y in Position :  
    if j == 0:
        lab = "Leader"
    else:
        lab = f"Follower {j}"
    j += 1
    plt.plot(x, y, label=lab) 

# Add title and labels
plt.title("String Stability test")
plt.xlabel("Time (ms) ")
plt.ylabel("Position Error (m)")
 
# Add a legend
plt.legend(loc = 1)

# Display the plot
plt.show()



# Create the plot
j = 0
for y in Velocity :  
    if j == 0:
        lab = "Leader"
    else:
        lab = f"Follower {j}"
    j += 1
    plt.plot(x, y, label=lab) 

# Add title and labels
plt.title("String Stability test")
plt.xlabel("Time (ms)")
plt.ylabel("Velocity (m/s)")

# Add a legend
plt.legend(loc = 1)

# Display the plot
plt.show()




# Create the plot
j = 0
for y in Acceleration :  
    if j == 0:
        lab = "Leader"
    else:
        lab = f"Follower {j}"
    j += 1
    plt.plot(x, y, label=lab) 
    plt.plot(x, y)  # Line 1

plt.title("String Stability test")
plt.xlabel("Time (ms)")
plt.ylabel("Acceleration (m/s^2)")
plt.legend(loc = 1)
# Display the plot
plt.show()








