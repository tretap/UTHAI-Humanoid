# UTHAI Humanoid

UTHAI Humanoid is humanoid robot that optimized for research and education purposes.

ระบบจำลองหุ่นยนต์มนุษย์เพื่อการศึกษาและพัฒนา

## Motivation & Objective & Scope

**ที่มาและความสำคัญ**

แรงบันดาลใจในการทำโปรเจคครั้งนี้

**วัตถุประสงค์**

ออกแบบโครงสร้างและพัฒนาระบบพื้นฐานสำหรับหุ่นยนต์ฮิวมานอยด์เพื่องานวิจัยหรือพัฒนาต่อยอด


**ขอบเขตงานวิจัย**

* ใช้ ROS เป็นเครื่องมือพัฒนาระบบ
* หุ่นยนต์ฮิวมานอยด์มี 18 DOF

## The core uthai team

* Jirad  Sreerattana-aporn   [Hardware designer]
* Chulaphat  Jirachai        [System state estimater]
* Jadsadakon  Tachaiwong     [Hardware designer]
* Peeraya  Pongpanyaporn     [Dynamic controller]
* Wuttipat  Chokanantasab    [Low-level controller]
* Sirawat  Soksawatmakin     [Motion and Path planing]


## Speacial Thanks To

* Aj.Pi


#### SOFTWARE :
1. Software Architecture `Chulaphat`
    - Version Control
        * Setting up Github
    - Network Protocol
        * Connecting SSH
    - System Environment
        * Operating System Set-up
            - Linux Tutorial
        * Software Set-up
            - MATLAB or other simulation software
            - Instruction for installing
    - Robot Operating System
        * Set up ROS Workspace
        * Background studies in using ROS
        * Background studies in simulation in ROS
        * Setting up Robot Class
 
 
1. Sensor `Wuttipat`
    - Encoders 
        * Background research on typical specs for encoders for humanoid
        * Background research on typical characteristics i.e. bandwidth, limits, resolution
        * Background studies in Encoders’ sensor model with humanoid’s dynamics
    - Inertial Measurement Unit (IMU)
        * Background research on the use of IMU in humanoid’s state estimators
        * Background studies in IMU’s sensor model with humanoid’s dynamics
    - Ground Contact Sensors
        * Background research on bipedal robot’s ground contact sensors
        * Selection of Sensors based on characteristics (limit switches/ force sensors)
 
1. State Estimators `Chulaphat`
    - Background research on humanoid’s state estimators
    - Background studies in Kalman Filter and Extended Kalman Filter
    - Integration between Encoders and IMU
 
1. Dynamics `Peeraya`
    - Background research in humanoid’s dynamics model
        * Studies hybrid nature of the dynamics
        * Studies the Poincare map
    - Review Serial Manipulator Dynamics
        * Compute Forward Kinematics of each frames
        * Compute Jacobian Matrices of each frames
        * Compute Dynamic Matrices of the manipulator
        * Obtain the dynamics equation of the manipulator
    - Background studies in Open Kinematics Chain
        * Studies Structure of Parameters
        * Compute Forward Kinematics of each frames
        * Compute Jacobian Matrices of each frames
        * Compute Dynamics Matrices of the chain
        * Obtain the dynamics equation of the chain
    - Background studies in Hybrid System Dynamics
        * Study and implement bouncing ball
        * Study and implement Compass Gait
        * Study and implement Passive Dynamics Walker
    - Background studies in Poincare Map
        * Simulate simple discreate Poincare Map
    - Background studies in CoM and CoP calculation
        * Implement calculation for CoM and CoP
    - Background studies in ZMP calculation
        * Implement calculation for ZMP

1. Control `Peeraya`
    - Background studies in Biped with point feet
    - Background studies in Biped with feet
    - Parameter Identification of Biped
        * Rough Estimation using CAD Model
    - Design and simulate controller
    - Implement and test the controller
        * Parameter tuning or using System Identification Toolbox
 
1. Motion Planning `Sirawat`
    - Background research on motion planning for humanoid
    - Optimization
        * Background studies in Linear and Nonlinear Programming (optimization)
        * Background studies in Integer Programming
        * Background studies in Mixed-Integer Programming
    - Discrete Path Planning
        * Review A*
        * Review value iteration
        * Review forward search, backward search, and bidirectional search
    - Motion Planning Background
        * Background studies in polygonal, polyhedral and semi-algebraic model
        * Background studies of topological spaces, manifolds, path, and C-space of rigid bodies + obstacle
    - Sampling-based motion planning
        * Background studies in Metric space, random sampling, grid, lattices, collision detection
        * Background studies in Rapidly-exploring Random Trees
        * Background studies in Probabilistic Roadmaps
    - Background studies in motion planning for Walking Gait Generation
 
 
#### HARDWARE :
1. Literature Review `Jirad, Jadsadakon`
    - Background research on Overall Structure of Humanoid
    - Background research on Overall System Architecture of Humanoid
    - Background research on Feet and Ground Contact Sensors
    - Background research on Motor Sizing and Drivers
    - Background research on Joint’s Transmission System
    - Background research on Power Source
1. Mechanical System Design `Jirad, Jadsadakon`
    - Skeleton Design
        * Checking Kinematics Feasibility
    - Motor Sizing
    - Motor Mount Design
    - Robot Structure Design
    - Full CAD Assembly
        * How-to-build Assembly instruction
        * BOM
    - Simulation Test and refine
    - Structure Optimization
1. Electrical System Design `Wuttipat`
    - Overall System Architecture
        * Thorough Block Diagram
    - Power Source
        * Finalize Specs
    - Mainboard
        * Schematics
    - Motor Drivers
    - Sensors
        * Encoders
        * IMU
        * Ground Contact Sensors
1. Fabrication `Jirad, Jadsadakon`
    - Order and Receive Mechanical Equipment
        * Motors
        * Screws
        * Etc
    - Order and Receive Electrical Components
        * Mainboard
        * Sensors
    - Order and Receive Part
        * Customized 3d-printed parts
        * Customized machined parts
        * Customized printed circuit boards
    - Assemble all components
        * Assemble all mechanical components
        * Include all electrical components
1. Testing `All`
    - Test Robot Movement
        * Checking for joints’ limits and kinematic feasibility
    - Test Actuation
        * Checking for power consumption
    - Test Sensing
        * Checking for accuracy and signal-to-noise ratio
 
 
#### INTEGRATION : `All`

1. Parameter Estimation for hardware
    - Log data from sensors
    - Perform parameter estimation
1. State Estimation & Control Integration (SC)
    - Simulate close-loop controlled humanoid and sensors with uncertainty
1. Motion Planning & SC Integration (MSC)
    - Combine Motion Planning with close-loop control and estimation system
1. Hardware & Control Integration
    - Calibrate for controlling actual hardware
1. Hardware & SC Integration
    - Adding state estimation to the controlled system
1. Hardware & MSC Integration
    - Full integration



