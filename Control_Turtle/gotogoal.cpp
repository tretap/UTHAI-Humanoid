#include <iostream>
#include <cmath>
#include <vector>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"

#define EPSILON 0.1

void turtlePoseCallback ( const turtlesim::Pose::ConstPtr&);
struct position{
	float x;
	float y;
	float theta;
};

std::vector<position>  target(2);
position current, delta;
geometry_msgs::Twist verocity;
float v0 = 10;
float kp = 10;
int i = 0;

int main (int argc, char **argv)
{

	ros::init(argc, argv, "gotogoal");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("turtle1/pose", 1000, turtlePoseCallback);
	ros::Publisher send = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel",1000);

	target[0].x = 1.0;
	target[0].y = 1.0;
	target[1].x = 3.25;
	target[1].y = 7.5;
	ros::Rate r(50);
	while(ros::ok()){
		send.publish(verocity);
		ros::spinOnce();
		r.sleep();
	}

	return 0;
}

void turtlePoseCallback ( const turtlesim::Pose::ConstPtr& msg){
	float v = 0;
	float w = 0;
	float e = 0;
	current.x = msg->x;
	current.y = msg->y;
	current.theta = msg->theta;
	ROS_INFO("X: %f , Y: %f , THETA: %f",current.x,current.y,current.theta);
	delta.x = target[i].x - current.x;
	delta.y = target[i].y - current.y;
	float error = sqrt( pow(delta.x,2.0) + pow(delta.y,2.0));

	v = v0 * error >= EPSILON ? 1:0;
	if(error < EPSILON && i < target.size()){
		i++;
	}
	if(i == target.size())
		ros::shutdown();
	e = atan2(delta.y,delta.x) - current.theta;
	w = kp * atan2(sin(e),cos(e));
	verocity.linear.x = v;
	verocity.angular.z = w;

}

