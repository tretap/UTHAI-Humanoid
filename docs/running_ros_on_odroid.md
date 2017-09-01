# Setup Ordoid boards

## Install Ubuntu mate on Odroid boards

อย่างที่บอกไปก่อนหน้านี้ Odroid boards นั้นทำงานคล้ายๆกับ PC \
ทำให้เราสามารถติดตั้ง Linux และติดตั้ง ROS ได้

วิธีการติดตั้ง ROS ลงบน Odroid

Download Ubuntu Mate Odroid จากลิ้งค์นี้ : \
[download ubuntu odroid](https://odroid.in/ubuntu_16.04lts/)

เลือกไฟล์ตามรุ่นของ Odroid \
ในที่นี้เลือก \
ubuntu-16.04.2-mate-odroid-c1-20170220.img.xz ขนาดไฟล์ 1.1G

หลังจากติดตั้งเสร็จแล้วให้เสียบสายทิ้งเอาไว้ประมาณ 45 นาที (เน็ต FIBO) ในการให้ Odroid Update ตัวเองให้เป็นเวอร์ชั่นล่าสุด

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
    $ ssh odroid@%ip_address%
    10.42.0.91
    password คือ odroid

ถ้าทุกอย่างถูกต้อง เราก็จะสามารถเข้าถึง odroid ผ่าน ssh ได้ และสามารถใช้คำสั่ง ros ได้


## install vnc server

## Controlling GPIO pins from ROS



And these are the commands to install wiringpi on Odroid:
$ git clone https://github.com/hardkernel/wiringPi.git
$ cd wiringPi
$ sudo ./build