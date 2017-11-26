# MATLAB using ROS
System: Ubuntu 16.04.02  
ROS: Kinetic  
MATLAB: R2017a \(Robotic Toolkit Required\)


## Introduction

Robot Operating System \(ROS\) เป็นการสื่อสารระหว่างแต่ละส่วนของหุ่นยนต์ ในการ รับ-ส่ง ข้อมูลระหว่างกัน MATLAB รองรับการทำงานร่วมกับ ROS ได้โดยสามารถใช้ฟังกั่นการทำงานต่างๆได้ ROS physical robot หรือ robot simulation เช่น Gazebo

## Initialize ROS Network

* เราใช้คำสั่ง `rosinit` เพื่อ Initialize ROS master service ใน MATLAB 
```
rosinit
```
> Initializing ROS master on http://liews:11311/.
> Initializing global node /matlab_global_node_83917 with NodeURI http://liews:33815/

* ใช้คำสั่ง `rosnode list` เพื่อที่จะดูโหนดทั้งหมดใน ROS network แต่จะใช้ได้ก็ต่อเมื่อเรารัน `rosinit` แล้วเท่านั้น
```
rosnode list
```
> /matlab_global_node_83917

* ใช้คำสั่ง `exampleHelperROSCreateSampleNetwork` เพื่อสร้าง demo node ที่ MATLAB สร้างไว้ให้
```
exampleHelperROSCreateSampleNetwork
```

* ใช้คำสั่ง `rosnode list` อีกครั้ง เพื่อที่จะดูว่ามีโหนดอะไรอยู่ใน ROS network
```
rosnode list
```
> /matlab_global_node_83917
> /node_1
> /node_2
> /node_3

 สถานะตอนนี้ถ้าหากแสดงเป็นภาพออกมาจะเห็นเหมือนภาพข้างล่างนี้ 
 ![](/assets/matlab_ros_1.png)
 ![](/assets/matlab_ros_2.png)

## Topics

* ใช้คำสั่ง `rostopic list` เพื่อที่จะดูว่ามี topic อะไรอยู่ใน ROS network [้าง
```
rostopic list
```
> /pose
> /rosout
> /scan

* ใช้คำสั่ง `rostopic info /XXX` เพื่อดูข้อมูลเกี่ยวกับ topic ที่เราสนใจ
```
rostopic info /pose
```
> Type: geometry_msgs/Twist
>
> Publishers:
> * /node_1 (http://liews:44355/)
> 
> Subscribers:
> * /node_2 (httpL//liews:38719/)

* ใช้คำสั่ง `rosnode info /XXX` เพื่อดูข้อมูลเกี่ยวกับ node ที่เราสนใจ
```
rosnode info /node_1
```
> Node: [/node_1]
> URI: [http://liews:44355/]
> 
> Publications (2 Active Topics): 
> * /pose
> * /rosout
> 
> Subscriptions (1 Active Topics): 
> * /scan
> 
> Services (0 Active): 

## Services

* ใช้คำสั่ง `rosservice list` เพื่อที่จะดูว่าใน ROS network มี service อะไรบ้าง
```
rosservice list
```
> /add
> /reply

* ใช้คำสั่ง `rosservice info /XXX` เพื่อดูข้อมูลเกี่ยวกับ service ที่เราสนใจ
```
rosservice info /add
```
> Node: /node_3
> URI: rosrpc://liews:33023/
> Type: roscpp_tutorials/TwoInts
> Args: A B

## Messages

* ใช้คำสั่ง `rostopic type /XXX` เพื่อดูว่า topic นั้นมี message type เป็นอะไร
```
rostopic type /pose
```
> geometry_msgs/Twist


* ใช้คำสั่ง `rosmsg show /XXX` เพื่อดู properties ที่อยู่ใน message type
```
rosmsg show geometry_msgs/Twist
```
> % This expresses velocity in free space broken into its Linear and Angular parts.
> Vector3  Linear
> Vector3  Angular

 ```
rosmsg show geometry_msgs/Vector3
```
> % This represents a vector in free space. 
> 
> double X
> double Y
> double Z

* ใช้คำสั่ง `rosmsg list` เพื่อดู message ทั้งหมดที่มีอยู่ใน MATLAB
```
rosmsg list
```
> ...
> zeroconf_msgs/AddListenerRequest                               
> zeroconf_msgs/AddListenerResponse                              
> zeroconf_msgs/AddServiceRequest                                
> zeroconf_msgs/AddServiceResponse                               
> zeroconf_msgs/DiscoveredService                                
> zeroconf_msgs/ListDiscoveredServicesRequest                    
> zeroconf_msgs/ListDiscoveredServicesResponse                   
> zeroconf_msgs/ListPublishedServicesRequest                     
> zeroconf_msgs/ListPublishedServicesResponse                    
> zeroconf_msgs/Protocols                                        
> zeroconf_msgs/PublishedService                                 
> zeroconf_msgs/RemoveListenerRequest                            
> zeroconf_msgs/RemoveListenerResponse                           
> zeroconf_msgs/RemoveServiceRequest                             
> zeroconf_msgs/RemoveServiceResponse   

## Shutdown ROS Network

* ใช้คำสั่ง `exampleHelperROSShutDownSampleNetwork` เพื่อที่จะลบ demo node ที่เราสร้างขึ้นมาออกจาก ROS network
```
exampleHelperROSShutDownSampleNetwork
```

* ใช้คำสั่ง `rosshutdown` เพื่อที่จะปิด ROS network ใน MATLAB ถ้าจะเปิดใหม่ก็ต้องใช้คำสั่ง `rosinit` ใหม่อีกครั้ง
```
rosshutdown
```
> Shutting down global node /matlab_global_node_83917 with NodeURI http://liews:33815/
> Shutting down ROS master on http://liews:11311/.

## Connect to an External ROS Master

ถ้าหากต้องการให้ rosinit ต่อกับ external ROS master เราจะต้องใส่ argument เพิ่มนิดหน่อย

ใน terminal window ใช้คำสั่ง `roscore` ในการรัน ROS master แล้วเราจะเห็น **ROS\_MASTER\_URL**:[http://XXX](http://XXX)

```
roscore
```

![](/assets/matlab_ros_2.png)  
ในที่นี้เป็น [http://liews:11311/](http://liews:11311/)

จากนั้นกลับมาที่ MATLAB Command Window

```
rosinit('http://liews:11311/')
```

![](/assets/matlab_ros_3.png)

หลังจากนั้นเราจะเห็นว่ามี Node ใหม่ถูกสร้างขึ้นมา **/matlab\_global\_node\_XXX**





