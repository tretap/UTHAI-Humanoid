
# Structure design and Platform development

UTHAI Humanoid robot

## Motivation & Objective & Scope

__ที่มาและความสำคัญ__

แรงบันดาลใจในการทำโปรเจคครั้งนี้

__วัตถุประสงค์__

ออกแบบโครงสร้างและพัฒนาระบบพื้นฐานสำหรับหุ่นยนต์ฮิวมานอยด์เพื่องานวิจัยหรือพัฒนาต่อยอด

__ขอบเขตงานวิจัย__

* ใช้ ROS เป็นเครื่องมือพัฒนาระบบ
* หุ่นยนต์ฮิวมานอยด์มี 18 DOF

## Why Humanoid platform ?

## What is UTHAI ?

### Uthai feature

### Structure 3D Print

## Background Research

### Other platform

- Nao
- Poppy
- Darwin
- iCup


## Hardware Overview

### Robot Schematic


### Actuators

Dynamixel EX-106+

Dynamixel is a kind of networked actuator for robots developed by Korean
manufacture ROBOTIS. It is widely used by companies, universities, and hobbyists
due to its versatile expansion capability, power feedback function, position, speed,
internal temperature, input voltage, and so on.
The Dynamixel servos can be connected in a daisy chain; it is a method of connecting
device in a serial fashion, that is, connecting one device to another through the
connected devices, and can control all the connected servos from one controller.

### Power Management

### Sensors


### Controlle

### Communication
การติดต่อสื่อสาร


## Software Overview


The software and control architecture of the humanoid robot ARMAR-III consists of three layers (see figure). On the lowest level, DSP perform low-level sensorimotor control realized as cascaded velocity-position control loops. On the same level, hardware such as microphones, loudspeakers, and cameras are available. All these elements are connected to the PCs in the mid-level, either directly or via CAN bus. The software in the mid-level is realized using the Modular Controller Architecture (MCA2). The PCs in the mid-level are responsible for higher-level control (forward and inverse kinematics), the holonomic platform, and speech processing.

The first two levels can be regarded as stable i.e. the implemented modules remain unchanged. The programming of the robot takes place on the highest level only. Here, the so-called robot interface allows for convenient access to the robot's sensors and actuators via C++ variables and method calls.

To allow for effective and efficient programming of the robot, in addition to direct access to the robot's sensors and actors, two abstraction levels are defined: tasks and skills. Skills implement atomic capabilities such as platform navigation, visual object search, grasping objects, placing objects, handing over objects, opening doors, closing doors, etc. Tasks are operate on a higher level and are composed of several skills, e.g. bringing juice from the fridge

การออกแบบซอฟแวร์และระบบควบคุมของหุ่นยนต์ UTHAI จะประกอบด้วย 3 เลเยอร์

เลเยอร์แรก หรือส่วนของ Hardware จะเป็นส่วนของพวกอุปกรณ์ต่างๆ เช่น มอเตอร์ เซนเซอร์ กล้อง ไมโครโฟน ลำโพง รวมไปถึงไดรเวอร์ด้วย เช่นตัวควบคุม PID, Speech,Audio 

เลเยอร์ที่สอง ใช้ Modular Controller Architecture ในการทำเป็นส่วนของ Hardware Services
เช่น Motion Control, forward kinematics, inverse kinematics, calculate com zmp,

สองส่วนแรกจะเป็นส่วนที่จะต้องทำให้มีความเสถียร ไม่ควรจะแก้โปรแกรมบ่อยๆ ส่วนที่จะแก้คือส่วนที่เป็น highest level เท่านั้น

skill เป็นเหมือนความสามารถเล็กๆเช่น navigation, visual object search, grasping object, placing object, opening door, close door, path planing, motion planing
speech recognition


task จะเป็นการรวมเอา skill หลายๆ skill มารวมกัน เช่น หยิบน้ำส้มออกจากตู้เย็น เดินวนรอบตึดฟีโบ้ นำทัวร์พิพิธภรรณ
### How to move robots?

![ROS framework](https://upload.wikimedia.org/wikipedia/commons/7/7a/ROS_cat.png)

ROS เป็น open-source ลักษณะเป็นเหมือน OS สำหรับหุ่นยนต์
เรียกใช้ service 

ใช้ภาษาได้หลากหลาย Python, C++, Java, Ruby, MATLAB and many others


### Simulation

Gazebo

Multi-robot simulator
Support for several types of sensors
Pluggable and extendable to add more components and robot models
Better integration with ROS


## Work Flow

1. Background Research
    1. Human Physiology (สรีระวิทยาของมนุษย์)
    1. Bipedal robot structure (โครงสร้างของหุ่นยนต์สองขา)
    1. Electronic componants
1. Design infrastructure
    1. Software Diagram (Communication)
    1. Skeletion (joint and link schematic)
1. Simulation
    1. Robot Simulation gazebo
    1. CAD 3D Model Robot
1. Real World
    1. Electornic sensor test
    1. Controller test
    1. Machanical build
1. Sumerize
    1. Caribrate sensor
    1. Make simulation param like realword
1. Test build application
    1. Walking Robot
1. Documentation
    1. Bomb of materials
    1. Assembly Guide
    1. ROS, How it works


## Planing
@Ganttchart

## Job Description
เอารูป 3 คนลงแล้วหน้าที่แต่ละคน


15นาทีทั้งหมด