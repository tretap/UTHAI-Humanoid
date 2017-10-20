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