# The Odroid board

ถ้าต้องการความเร็วในการประมวลผลมากกว่า Raspberry Pi, Odroid สามารถตอบโจทย์นี้ได้ Odroid-XU4 เป็นรุ่นล่าสุดที่ออกมาขายในปัจจุบัน มีความเร็วในการประมวลผล 2 GHz quad-core และแรม 2 GB ซึ่งมากกว่า RPi  ในขณะที่ใช้พลังงงานพอๆกัน ลักษณะการทำงานของ Odroid จะคล้ายๆกับ Computer

Odroid-XU4 สามารถลง Ubuntu 16.04 ,Android 4.4 KitKat, 5.0 Lollipop, 7.1 Nougat ได้

![Odroid-XU4](/assets/odroid_xu4.jpg)

## Running ROS on Odroid boards

การติดตั้ง ROS ลงบน Odroid มีวิธีการลงอยู่ 2 แบบคือ

1. ลง Linux OS เปล่าๆ แล้วถึงลง ROS ตาม
2. ลง Linux OS ที่มี ROS มาพร้อมให้ในตัวอยู่แล้ว

เราจะมาสอนลง ROS บน Odroid แบบที่ 2 คือมี ROS prebuild มาให้

### Install Ubuntu mate on Odroid boards

1. Download Odroid-ROS images จากลิ้งค์ข้างล่างนี้

   Download Ubuntu select manual: [Here](https://odroid.in/ubuntu_16.04lts/)  
   Download Odroid-C1: [Here](https://odroid.in/ubuntu_16.04lts/ubuntu-16.04.3-mate-odroid-c1-20170908.img.xz) 1.1G  
   Download Odroid-XU4: [Here](https://odroid.in/ubuntu_16.04lts/ubuntu-16.04.3-4.9-mate-odroid-xu4-20170824.img.xz) 1.2G

2. Download Burn images to SD card จากลิ้งค์เว็บข้างล่างนี้

   Download Etcher Windows\(x64\): [Here](https://github.com/resin-io/etcher/releases/download/v1.1.2/Etcher-Portable-1.1.2-x64.exe)  
   Download Etcher Windows\(x86\): [Here](https://github.com/resin-io/etcher/releases/download/v1.1.2/Etcher-Portable-1.1.2-x86.exe)  
   Download Etcher Linux: [Here](https://github.com/resin-io/etcher/releases/download/v1.1.2/etcher-1.1.2-linux-x86_64.zip)

3. ใส่ SDcard เข้าเครื่องคอมพิวเตอร์

4. เขียนไฟล์ Image ลง SDcard

   เปิดโปรแกรม Etcher ขึ้นมา กดเลือก Select image

   ![Etcher\_1](/assets/Etcher_1.png)
   เลือกไฟล์ Image ที่ต้องการลงใน Odroid
   ![Etcher\_2](/assets/Etcher_2.png)
   กด Select Drive แล้วเลือก SDcard ที่ต้องการ
   ![Etcher\_3](/assets/Etcher_3.png)  
   ![Etcher\_4](/assets/Etcher_4.png)  
   กด Flash แล้วรอให้โปรแกรม Burn เสร็จ
   ![Etcher\_5](/assets/Etcher_5.png)  
  
   ![Etcher\_7](/assets/Etcher_7.png)
   
   ใช้ระยะเวลาประมาณ 30 นาที
   


## Connecting Odroid to PC

ในการเชื่อมต่อ Odroid boards เข้ากับ PC นั้นมีหลักๆอยู่ 2 วิธี

1. เชื่อมต่อโดยการให้ devices ทั้งคู่ต่อเข้ากับ network เดียวกัน
2. เชื่อมต่อโดยตรงโดยไม่ผ่าน router แต่ใช้ Wired LAN หรือ Wi-Fi hotspot แทน

วิธีการตั้งค่า wired hotspot บน Ubuntu สำหรับการเชื่อมต่อกับ boards

1. คลิกที่ Edit Connection... ตรง network option ตามรูป หลังจากนั้นคลิก Add เพื่อที่จะสร้าง connection อันใหม่ขึ้นมา

2. new Ethernet connection ตั้งชื่อว่า Share และกดไปที่ Tab IPv4 Setting เลือก Method เป็น Shared to other computers

3. หลังจากสร้างเสร็จแล้วก็ในนำ SD card ใส่เข้าไปในบอร์ด Odroid และเสียบ Power Source แล้วต่อสาย LAN เข้ากับ PC

4. เมื่อ Board boots up ขึ้นมาแล้วมันจะเชื่อมต่อ Share Network โดยอัตโนมัติถ้าหากเชื่อมต่อถูกต้อง แสดงว่าตอนนี้ Board Odroid นั้นจะมี IP Address เป็นของตัวเอง

5. ถึงตอนนี้เราจำเป็นที่จะต้องรู้ว่า ip address เป็นอะไร คำสั่งที่จะค้นหามันก็คือ \  
    $ cat /var/lib/misc/dnsmasq.leases

   จะได้ค่าตามแบบที่เห็นนี้

6. ถ้าได้ ip address มาแล้วก็แสดงว่าเราสามารถที่จะติดต่อสื่อสารกับ board ของเราได้แล้วผ่าน SSH  
    $ ssh odroid@%ip\_address%  
    10.42.0.91  
    password คือ odroid

ถ้าทุกอย่างถูกต้อง เราก็จะสามารถเข้าถึง odroid ผ่าน ssh ได้ และสามารถใช้คำสั่ง ros ได้

## install vnc server

## Controlling GPIO pins from ROS

And these are the commands to install wiringpi on Odroid:  
$ git clone [https://github.com/hardkernel/wiringPi.git](https://github.com/hardkernel/wiringPi.git)  
$ cd wiringPi  
$ sudo ./build
