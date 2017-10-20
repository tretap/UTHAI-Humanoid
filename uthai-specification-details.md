http://support.robotis.com/en/techsupport_eng.htm#product/thormang3_main.htm

# Joint Name & ID map

##### U2D_CHANNEL2

| ID | JointName |
| :-: | :-------: |
| 1 | l_leg_hip_y |
| 2 | l_leg_hip_r |
| 3 | l_leg_hip_p |
| 4 | l_leg_kn_p |
| 5 | l_leg_an_p |
| 6 | l_leg_an_r |

##### U2D_CHANNEL3

| ID | JointName |
| :-: | :-------: |
| 11 | r_leg_hip_y |
| 12 | r_leg_hip_r |
| 13 | r_leg_hip_p |
| 14 | r_leg_kn_p |
| 15 | r_leg_an_p |
| 16 | r_leg_an_r |

## High Performance and Advanced Features

* Default walking speed: 100.0 cm/sec.
* Management controller: Nucleo
* 20 actuator modules (6 DoF leg x2 + 3 DoF arm x2 + 2 DoF neck)
* Actuators with durable metalic gear (Dynamixel EX-106+)
* 1Mbps high-speed Dynamixel bus for joint control
* 3-axis gyro, 3-axis accelerometer



## Actuator Spec Specifications

| Description | EX-106+ |
| :---------: | :-----: |
| Weight | 82g |
| Dimension | 28.5mm x 25mm x 43mm |
| Gear Ratio | 333:1 |
| Stall Torque | 4.5 N.m |
| Stall Current | 2.3 A |
| No Load Speed | 55 RPM |
| Protocol | 1.0,2.0 |

## The Mechanical Design of Uthai Humnaoid

ได้ตัวอย่างการออกแบบมาจากหุ่นยนต์ตัวไหนก็ไม่รู้ หาก่อน

### Design concept

หุ่นยนต์ถูกออกแบบโดย แท้และเบิร์ด ตามคอนเซปด้านล่างนี้

* น้ำหนักเบา แข็งแรง ทนทาน
* ง่ายต่อการพัฒนาต่อยอด

### Specifications of Uthai Humanoid 

| Description | Uthai Robot 1-A |
| :---------: | :------------: |
| Hight | About 1030mm |
| Weight | About 3.5kg |
| Hight of CoM | 800mm |
| Feet size | 150 x 150 mm |
| DOF | 12 xxxx |
| Actuator | Dynamixel EX-106+ |
| Main Controller | Odroid xxxx |
| Sub Controller | Nucleo F411RE 100MHz ARM Cortex xxxx |
| Camera | xxx |
| Sensor | 3-Axis Gyroscope 3-Axis Accelerometer 3-Axis Magnetometer |
| Power Source | LIPO or Switching Power Supply |
| Developement Environment | OS: Linux, ROS, Python, C++, MATLAB, Dynamixel SDK |
| Networking | Eternet WiFi |

### DH-Parameter of Uthai Humaoid

| link(i) | a(i) | al(i) | d(i) | theta(i) |
| :-----: | :--: | :--: | :--: | :--: |
| 1 | 0 | pi/2 | 0 | pi+\theta |
| 2 | 0 | pi/2 | 0 | pi+theta(1) |
| 3 | 0 | pi/2 | 0 | pi+theta(1) |
| 4 | 0 | pi/2 | 0 | pi+theta(1) |
| 5 | 0 | pi/2 | 0 | pi+theta(1) |
| 6 | 0 | pi/2 | 0 | pi+theta(1) |
| 7 | 0 | pi/2 | 0 | pi+theta(1) |