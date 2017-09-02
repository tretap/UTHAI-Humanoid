#!/bin/bash

name_uthaiws=${name_uthaiws:="uthai_ws"}
name_ros_distro=${name_ros_distro:="kinetic"}

version=`lsb_release -sc`

echo "[Checking the ubuntu version]"
case $version in "xenial");;*)
    echo "ERROR: This script will only work on Ubuntu Xenial. Exit."
    exit 0
esac

echo "[Update & Upgrade the package]"
sudo apt update
sudo apt upgrade

echo "[Add the ROS repository]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
    sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu ${version} main\" > /etc/apt/sources.list.d/ros-latest.list"
fi

echo "[Update & Upgrade the package]"
sudo apt update
sudo apt upgrade

echo "[Installing ROS]"
sudo apt install -y ros-$name_ros_distro-desktop-full ros-$name_ros_distro-rqt-*

echo ["rosdep init and python-rosinstall"]
if [ ! -e /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo sh -c "rosdep init"
fi

rosdep update
. /opt/ros/$name_ros_distro/setup.sh
sudo apt install -y python-rosinstall

echo "[Make the uthai workspace and testing the catkin_make]"
mkdir -p ~/$name_uthaiws/src
cd ~/$name_uthaiws/src
catkin_init_workspace
cd ~/$name_uthaiws
catkin_make

echo "[Setting the ROS environment]"
sh -c "echo \"source /opt/ros/$name_ros_distro/setup.bash\" >> ~/.bashrc"
sh -c "echo \"source ~/$name_uthaiws/devel/setup.bash\" >> ~/.bashrc"
sh -c "echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/.bashrc"
sh -c "echo \"export ROS_HOSTNAME=localhost\" >> ~/.bashrc"

echo "[Complete!!!]"

exec bash
exit 0