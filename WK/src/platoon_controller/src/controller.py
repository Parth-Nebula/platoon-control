#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry

from math import acos , sin , pi

rospy.init_node("Controller")
rospy.loginfo("Controller Node is created")



robot_count = 3
buffer = 0.4
ideal_velocity = 0.5
accepted_error = 0.1
leader_position = 0
time_delta = 0

class Vehicle :
    min_v = 0
    max_v = 1
    max_a = 0.5
    min_a = -0.5
    a = 0
    v = 0
    x = 0
    P = None
    i = 0
    st = 0

    temp = Odometry()
    position_state = temp.pose.pose
    velocity_state = temp.twist.twist

    def satisfy ( self ) :
        self.a = max(self.a,self.min_a)
        self.a = min(self.a,self.max_a)
        self.v = max(self.v,self.min_v)
        self.v = min(self.v,self.max_v)
    
    def set_a ( self ) :

        if self.P == None : return
        D  = buffer
        D += max ( ((self.P.v)**2)/(2*self.P.min_a) - ((self.v)**2)/(2*self.min_a) , 0 )        
        
        if ( abs ( (leader_position-self.x) - (self.i*buffer*2) ) > accepted_error )  or ( abs( self.P.x - self.x ) < buffer ) :
            self.st = 0

        else :
            #if ( abs ( (leader_position-self.x) - (self.i*buffer*2) ) < accepted_error ) and ( abs( self.P.x - self.x - buffer - buffer*0 ) < accepted_error ) :
            self.st = 1
            self.a = 0
            self.v = ideal_velocity
        
        if self.st == 0  :
            if self.P.x - self.x < D :
                self.a = self.min_a

            elif (leader_position-self.x) - (self.i*buffer*2) > accepted_error :
                self.a = self.max_a

            elif (leader_position-self.x) - (self.i*buffer*2) < -accepted_error :
                self.a = self.min_a
                
            #elif self.P.x - self.x > D :
            #    self.a = self.max_a
        print(self.i,self.a)

Vehicles = [ Vehicle() for i in range ( robot_count ) ]


for i in range ( 1 , robot_count ) :
    Vehicles[i].P = Vehicles[i-1]
    Vehicles[i].i = i

def update_state ( i , msg : Odometry ) :
    Vehicles[i].position_state = msg.pose.pose
    Vehicles[i].position_state.position.x *= -1
    Vehicles[i].velocity_state = msg.twist.twist
    
def function_factory ( i ) :
    def f ( msg ) :
        update_state ( i , msg )
    return f

Pub = [ rospy.Publisher(f"/tb3_{i}/cmd_vel" , Twist , queue_size = 10 ) for i in range ( robot_count ) ]

Cal = [ function_factory(i) for i in range ( robot_count ) ]

Sub = [ rospy.Subscriber(f"/tb3_{i}/odom" , Odometry , callback = Cal[i] ) for i in range ( robot_count ) ]

def empty_msg () :
    msg = Twist()
    msg.linear.x =  0
    msg.linear.y = 0 
    msg.linear.z = 0
    msg.angular.x = 0
    msg.angular.y = 0
    msg.angular.z = 0 
    return msg

def normalise_angle ( theta ) :
    theta %= 2*pi
    if ( theta > pi ) : theta -= 2*pi
    return theta 
    
def quaternionToAxisAngle ( orientation ) :

    axis , angle = [ 1 , 0 , 0 ] , 0
 
    CosThetaBy2 = orientation.w
    ThetaBy2    = acos(CosThetaBy2)
    angle       = 2*ThetaBy2

    SinThetaBy2 = sin(ThetaBy2)
    axis = [ orientation.x/SinThetaBy2 , orientation.y/SinThetaBy2 , orientation.z/SinThetaBy2 ]

    return axis , normalise_angle(angle)


ideal_angle = pi

def angular_correction ( i , msg : Twist ) :
    axis,angle = quaternionToAxisAngle(Vehicles[i].position_state.orientation)
    angleError = normalise_angle(angle-ideal_angle)
    msg.angular.z = -1*angleError

def linear_correction ( i , msg : Twist ) :
    if i == 0 :
        msg.linear.x = ideal_velocity
        return
    msg.linear.x = Vehicles[i].v + Vehicles[i].a*time_delta



def updateAllStates () :
    global leader_position
    leader_position = Vehicles[0].position_state.position.x
    for vehicle in Vehicles :
        vehicle.x = vehicle.position_state.position.x
        vehicle.v = vehicle.velocity_state.linear.x
    for vehicle in Vehicles :
        vehicle.set_a()
    
    for vehicle in Vehicles :
        print(vehicle.i)
        print(vehicle.x)
        print(vehicle.v)
        print(vehicle.a)
        print(vehicle.position_state)
        print(vehicle.velocity_state)
        print("\n"*5)


rate = rospy.Rate(10)

while not rospy.is_shutdown() :
    if Vehicles[0].v != 0 :
        time_delta = (Vehicles[0].position_state.position.x - Vehicles[0].x)/Vehicles[0].v
    print("ff44f4f",time_delta)
    updateAllStates()
    for i in range ( robot_count ) :
        msg = empty_msg()
        linear_correction(i,msg)
        angular_correction(i,msg)
        print(msg) 
        Pub[i].publish(msg)
    rate.sleep()