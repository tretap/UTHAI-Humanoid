# Make URDF from Robot model in Solidworks


## Simulation vs Visualize

Simulation เกิดจาการคำนวณทางฟิสิกส์ ไม่เหมือน Visualizes ที่เกิดจาการคำนวณ kinamtic อย่างเดียว

Visualize
ยกตัวอย่างสั่งหุ่นยนต์เดินให้ไป 1 เมตร หุ่นยนต์ก้จะไปที่ 1 เมตร แต่หุ่นยนต์ไปจริงหรือไม่ไม่รู้

แต่ถ้าเป็น simulation จะเป็นการคำนวณที่หากเราใส่ Property ไม่เหมาะสมก็อาจจะทำให้หุ่นยนต์ไม่ไปก็ได้


## Modeling Robot

เป็นการเขียนไฟล์เพื่ออธิบายว่าหุ่นยนต์ของเรามีหน้าตาอย่างไร ล้อห่างจากเซนเตอร์กี่เซนติเมตร

### Simple Robot Model in URDF

ใน package จะมี dyrectory ชื่อ urdf ซึ่งข้างในจะมีไฟล์ urdf ของหุ่นยนต์หลายๆตัวได้ หรือแบ่งส่วนๆได้

``` xml
<?xml version="1.0"?>
<robot name="myfirst">
    <link name="base_link">
        <visual>
            <geometry>
                <cylinder length="0.6" radius="0.2"/>
            </geometry>
        </visual>
    </link>
</robot>
```

### Multiple Shapes

``` xml
<?xml version="1.0"?>
<robot name="multipleshapes">
    <link name="base_link">
        <visual>
            <geometry>
                <cylinder length="0.6" radius="0.2"/>
            </geometry>
        </visual>
    </link>

    <link name="right_leg">
        <visual>
            <geometry>
                <box size="0.6 0.1 0.2"/>
            </geometry>
        </visual>
    </link>

    <joint name="base_to_right_leg" type="fixed">
        <parent link="base_link"/>
        <child link="right_leg"/>
    </joint>
</robot>
```

# 3D Modeling in ROS [URDF]

หลังจากที่เราได้ออกแบบและโมเดลหุ่นยนต์ของเราขึ้นมาที่ใช้ CAD tools ต่างๆ เช่น AutoCAD, SolidWorks, Blender หรืออื่นๆ ก็เพื่อที่จะนำมาใช้ในการทำ Simulation การที่เราทำ Simulation นั้นก็จะสามารถมองเห็นหุ่นยนต์และเห็นการทำงานของหุ่นยนต์เราก่อนที่เราจะสร้างมันขึ้นมาจริงๆ 

หุ่นยนต์จำลองที่เราสร้างขึ้นมานั้นควรที่จะมีลักษณะให้ใกล้เคียงกับของจริงมากที่สุด ไม่ว่าจะเป็นรูปร่าง รูปทรง น้ำหนักต่างๆ 

## ROS packages for robot modeling

ROS นั้นได้ให้เครื่องมือที่ช่วยให้เราสามารถสร้าง 3D robot models ได้

* robot_model : ใน ROS มี meta package ที่ชื่อว่า robot_model ซึ่งข้างในมี package ต่างๆที่ใช้สำหรับสร้าง 3D robot models
    * urdf : เป็น 1 ในหลายๆ package ที่อยู่ใน robot_model, urdf เป็น xml ไฟล์ที่เอาไว้ใช้บอกลักษณะของหุ่นยนต์ ย่อมาจาก Unified Robot Description Format(URDF)

* เราสามารถระบุ robot model, sensors และ working environment โดยใช้ URDF การบอกนั้นจะสามารถบอกเป็นเหมือน tree structure ของ link ต่างๆในตัวหุ่นยนต์ สามารถบอก rigid link เชื่อมต่อกันผ่าน joints แต่ถ้าเป็น flexible link จะไม่สามารถบอกได้โดยใช้ urdf

    * joint_state_publisher: เครื่องมือนี้มีประโยชน์มากในการ model robot URDF เพราะมันสามารถหา joints ทุก joint ที่ไม่ใช่ fixed joints มาแสดงเป็น GUI sliders ทำให้เราสามารถเลื่อนๆหมุนๆไปมาได้ อีกทั้งยังสามารถใช้งานร่วมกับ visualize RViz
    * robot_state_publisher: เป็นเครื่องมือที่ใช้ในการ publish 3d pose ของ link ต่างๆใน urdf การ ยublish นั้นจะใช้ ROS tf(transform) ROStf คือการหาความสัมพันธ์ระหว่าง frame ของหุ่นยนต์
    * xacro: ย่อมาจาก XML Macros หรือเราสามารถเรียกอีกอย่างว่า URDF plus add-ons. ซึ่งการทำงานเหมือนกับ urdf แต่ทำให้ไฟล์ urdf สั้นกว่า อ่านง่ายกว่า และสามารถใช้เพื่อทำให้สร้างหุ่นยนต์ที่มีความซับซ้อนง่ายขึ้น เราสามารถแปลงไฟล์ xacro เป็น urdf ได้
    
## Understanding robot modeling [URDF]





