#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry

from math import acos , sin , pi

rospy.init_node("Controller")
rospy.loginfo("Controller Node is created")

robot_count = 3

timer = 0

temp = Odometry()

Position_State = [ temp.pose.pose ] * robot_count

Velocity_State = [ temp.twist.twist ] * robot_count

def update_state ( i , msg : Odometry ) :
    Position_State[i] = msg.pose.pose
    Velocity_State[i] = msg.twist.twist
    
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




def linear_correction ( i , msg : Twist ) :
    if timer < 100 : 
        msg.linear.x = 1
    elif timer < 150 :
        msg.linear.x = 0.1
    else :
        msg.linear.x = 0.5
    pass


ideal_angle = pi

def angular_correction ( i , msg : Twist ) :
    axis,angle = quaternionToAxisAngle(Position_State[i].orientation)
    angleError = normalise_angle(angle-ideal_angle)

    msg.angular.z = -1*angleError

rate = rospy.Rate(10)

while not rospy.is_shutdown() :

    timer += 1
    print(timer)

    for i in range ( robot_count ) :
        msg = empty_msg()
        linear_correction(i,msg)
        angular_correction(i,msg)    
        Pub[i].publish(msg)

    rate.sleep()