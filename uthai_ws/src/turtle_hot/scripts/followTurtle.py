#!/usr/bin/env python

from math import atan2, cos, sin, sqrt

import rospy
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty
from turtlesim.msg import Pose
from turtlesim.srv import Spawn

goal = [5, 5]


def get_goal(data):
    global goal
    goal = [data.x, data.y]


def controller(data, args):
    global goal
    x, y, theta = data.x, data.y, data.theta
    xg, yg = goal
    turtle = args
    Kp = 10
    v = 0.8
    cmd_vel = Twist()
    e = atan2(yg - y, xg - x) - theta
    dist = sqrt((yg - y) ** 2 + (xg - x) ** 2)
    if dist >= 0.1:
        cmd_vel.linear.x = v * dist
    else:
        cmd_vel.linear.x = 0
    cmd_vel.angular.z = Kp * atan2(sin(e), cos(e))
    turtle.publish(cmd_vel)
    text = "x:{}, y:{}, theta:{}, dist:{}".format(x, y, theta, dist)
    rospy.loginfo(text)


def followTurtle():
    Reset = rospy.ServiceProxy('reset', Empty)
    Reset()
    Create = rospy.ServiceProxy('spawn', Spawn)
    Create(1, 1, 0, 'turtle2')

    rospy.init_node('followTurtle')
    turtle2 = rospy.Publisher('turtle2/cmd_vel', Twist, queue_size=10)
    rospy.Subscriber("turtle1/pose", Pose, callback=get_goal)
    rospy.Subscriber("turtle2/pose", Pose, callback=controller,
                     callback_args=(turtle2))
    rospy.spin()


if __name__ == '__main__':
    try:
        followTurtle()
    except rospy.ROSInterruptException:
        pass
