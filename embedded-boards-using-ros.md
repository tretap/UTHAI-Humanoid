# The Odroid board

ถ้าต้องการความเร็วในการประมวลผลมากกว่า Raspberry Pi, Odroid สามารถตอบโจทย์นี้ได้ Odroid-XU4 เป็นรุ่นล่าสุดที่ออกมาขายในปัจจุบัน มีความเร็วในการประมวลผล 2 GHz quad-core และแรม 2 GB ซึ่งมากกว่า RPi  ในขณะที่ใช้พลังงงานพอๆกัน ลักษณะการทำงานของ Odroid จะคล้ายๆกับ Computer

Odroid-XU4 สามารถลง Ubuntu 16.04 ,Android 4.4 KitKat, 5.0 Lollipop, 7.1 Nougat ได้

![Odroid-XU4](/assets/odroid_xu4.jpg)

### Running ROS on Odroid boards

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
   กด Select drive แล้วเลือก SDcard ที่ต้องการ แล้วกด Continue  
   ![Etcher\_3](/assets/Etcher_3.png)  
   ![Etcher\_4](/assets/Etcher_4.png)  
   กด Flash แล้วรอให้โปรแกรม Burn เสร็จ  
   ![Etcher\_5](/assets/Etcher_5.png)

   ![Etcher\_7](/assets/Etcher_7.png)

   ใช้ระยะเวลาประมาณ 30 นาที

### Connecting Odroid to PC 

1. คลิกที่ Edit Connection... ตรง Network Option ตามรูป หลังจากนั้นคลิก Add เพื่อที่จะสร้าง Connection อันใหม่ขึ้นมา
![ssh\_1](/assets/ssh_1.jpg)
เลือกเป็น Ethernet แล้วกด Create...
![ssh\_2](/assets/ssh_2.png)

2. Connection name ตั้งชื่อว่า Shared และกดไปที่ Tab IPv4 Setting เลือก Method เป็น Shared to other computers
![ssh\_3](/assets/ssh_3.png)

3. หลังจากสร้างเสร็จแล้วก็ในนำ SDcard ใส่เข้าไปใน Odroid เสียบสาย power 5V แล้วต่อสาย LAN เข้ากับ PC

4. เมื่อ Board boots up ขึ้นมาแล้วมันจะเชื่อมต่อ Share Network โดยอัตโนมัติถ้าหากเชื่อมต่อแล้ว หมายความว่าตอนนี้ Board Odroid นั้นจะมี IP Address เป็นของตัวเอง

5. ถึงตอนนี้เราจะต้องหาว่า IP address ของ Odroid เป็นอะไรถึงจะเข้าไปควบคุมได้ ซึ่งคำสั่งที่จะหาก็คือ

   ```bash
   $ cat /var/lib/misc/dnsmasq.leases
   ```
   จะได้ค่าตามแบบที่เห็นนี้

6. หลังจากได้ IP address มาแล้วก็แสดงว่าเราสามารถที่จะติดต่อกับ Odroid ผ่าน SSH ได้

   ```bash 
   $ ssh odroid@%ip_address_ของ_odroid%
   ```  
   ในที่นี้คือ 10.42.0.91 จะใช้คำสั่งเป็น
   ```bash
   $ ssh odroid@10.42.0.91 
   ```  
   Password Default จะเป็น `odroid`
   
7. ถ้าทุกอย่างถูกต้อง เราก็จะสามารถเข้าถึงและควบคุม Odroid ผ่านทาง SSH ได้

8. ทดลองใช้คำสั่ง `roscore` หากเห็นแบบในรูปก็แสดงว่าสามารถใช้งาน ROS ได้แล้ว


