#!/bin/bash

name_uthaiws=${name_uthaiws:="uthai_ws"}
name_ros_distro=${name_ros_distro:="kinetic"}

version=`lsb_release -sc`

echo "[ROS Kinetic ONLY supports Wily(Ubuntu 15.10) , Xenail(Ubuntu 16.04)]"
printf "Do you want to install ROS (Y/n)"
read install
if [ "$install" == "N" ] || [ "$install" == "n" ]; then
    exit 0
fi

echo "[Checking the ubuntu version]"
case $version in
    xenail)
        ;;
    willy)
        ;;
    *)
        echo "ERROR: ROS doesn't support Ubuntu $version "
        exit 0
        ;;
esac

echo "[Add the ROS repository]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
    sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu ${version} main\" > /etc/apt/sources.list.d/ros-latest.list"
fi

echo "[Set up your keys]"
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

echo "[Update & Upgrade the package]"
sudo apt update
sudo apt upgrade

printf "\n1.Desktop-Full Install:(Recommended):ROS,rqt,rviz,robot-generic libraries, 2D/3D simulators, navigation and 2D/3D perception\n"
printf "2.Desktop Install: ROS,rqt,rviz,and robot-generic libraries\n"   
printf "3.ROS-Base:ROS package,build,and communication libraries. No GUI tools\n"  
printf "(1-3)"
read selected
while :
do
    case $selected in
        1)
            echo "[Installing ROS]"
            sudo apt-get install -y ros-$name_ros_distro-desktop-full
            break;
            ;;
        2)
            echo "[Installing ROS]"
            sudo apt-get install -y ros-$name_ros_distro-desktop
            break;
            ;;
        3) 
            echo "[Installing ROS]"
            sudo apt-get install -y ros-$name_ros_distro-ros-base
            break;
            ;;
        *)
            echo "ONLY 1-3"
            read  selected
            ;;
    esac
done    

echo "[rosdep init and python-rosinstall]"
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