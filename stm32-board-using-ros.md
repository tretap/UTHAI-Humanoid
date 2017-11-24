# The STM32 board

ถ้าการใช้ Arduino ไม่เพียงพอต่อการใช้ในหุ่นยนต์ของเรา ไม่ต้องห่วง ในปัจจุบันมี ARM-based controller boards อยู่มากมาย เช่น STM32 microcontroller based ที่เรียกว่า NUCLEO
![](/assets/mbed_0.png)

### STM32 PinOut
![](/assets/mbed_22.png)
![](/assets/mbed_21.png)

### เริ่มเขียนโปรแกรมโดยใช้ STM32 board

1. สมัครสมาชิกที่เว็บไซต์ mbed  
   [https://os.mbed.com/](https://os.mbed.com/)

2. หลังจากสมัครสมาชิกเสร็จแล้ว เข้าไปดู board ที่ระบบรองรับ  
   [https://os.mbed.com/platforms/](https://os.mbed.com/platforms/)

3. เราจะเลือก board ของเราได้จากหน้านี้ ในที่นี้เราจะเลือก NUCLEO F411RE board  
   ![](/assets/mbed_1.png)  
   หรือเข้าไปที่หน้านี้ [https://os.mbed.com/platforms/ST-Nucleo-F411RE/](https://os.mbed.com/platforms/ST-Nucleo-F411RE/)  
   ![](/assets/mbed_2.png)

4. เราจะเห็นปุ่ม Add to your mbed compiler อยู่ตรงทางขวาของเพจ ให้กดปุ่มเพื่อที่จะเพิ่ม board นี้เข้า mbed compiler 
   ![](/assets/mbed_3.png)
   
5. หลังจากเพิ่ม board เข้า compiler แล้ว เราจะเขียนโปรแกรมได้โดยการเข้าไปที่ mbed compiler
   หรือเข้าไปที่ [https://os.mbed.com/compiler/](https://os.mbed.com/compiler/)
   ![](/assets/mbed_4.png)

6. กดสร้างโปรแกรมใหม่ขึ้นมา เพื่อทดสอบการทำงานของ board โดยใช้โปรแกรมตัวอย่าง mbed blinkly
   ![](/assets/mbed_5.png)
   
   เปิดไฟล์ maim.cpp แล้วกด compile
   ![](/assets/mbed_6.png)
   ![](/assets/mbed_7.png)
   ![](/assets/mbed_8.png)
   
   หลังจากนั้นจะได้ไฟล์ binary (.bin) ซึ่งสามารถนำไปใส่ไว้ใน flash drive ของ board
   ![](/assets/mbed_9.png)
   
   ถ้าเห็นไฟสีเหลืองกระพริบๆ แสดงว่า STM32 board ของเราพร้อมสำหรับการทำ ROS Node แล้ว

### เริ่มเขียนโปรแกรม STM32 board ให้เป็น ROS Node

1. เปิด mbed compiler ขึ้นมาหรือเข้าไปที่ [https://os.mbed.com/compiler/](https://os.mbed.com/compiler/) แล้วกด Import
   ![](/assets/mbed_10.png)
   
2. ทางช่อง Search ขวามือ ให้พิมพ์คำว่า rosserial_mbed ลงไป แล้วกด Search
   ![](/assets/mbed_11.png)
   
   จากนั้นจะเห็นรายชื่อโปรแกรม ให้กดเลือกที่ rosserial_mbed_hello_world_publisher_kinetic ของ Gary Servin
   ![](/assets/mbed_12.png)
   
   และให้ Import! ที่อยู่เหนือปุ่ม Search ระบบจะเด้งหน้าต่างขึ้นมา ให้ติ๊กที่ Update all แล้วกด Import
   ![](/assets/mbed_13.png)
   
3. เปิดไฟล์ main.cpp แล้วกด Compile
   ![](/assets/mbed_14.png)
   
   จากนั้นก็ทำแบบเดิมเซฟไฟล์ .bin แล้วก๊อปไปไว้ใน mbed drive

4. เมื่อก๊อปไฟล์เสร็จแล้ว board จะรัน code นั้นโดยอัตโนมัติ เป็นอันจบขั้นตอน เหลือแค่ทดสอบรัน ROS ทางฝั่ง PC 

   Start roscore : เปิด Terminal
```
$ roscore
```
![](/assets/mbed_15.png)

   Start the ROS server: เปิด Teminal tab ใหม่ขึ้นมา
```
$ rosrun rosserial_python serial_node.py /dev/ttyACM0
```
![](/assets/mbed_16.png)

   List ROS topics: เปิด Terminal tab ใหม่ขึ้นมา
```
$ rostopic list -v
```
![](/assets/mbed_17.png)
จะเห็นว่ามี Subcribed topics ที่ชื่อว่า `/toggle_led` ขึ้นมา ซึ่งเป็นการรอสั่ง toggle led หลังจากได้รับ message ที่เป็นชนิด `std_msgs/Empty`

   Test toggle led:
```
$ rostopic pub -1 /toggle_led std_msgs/Empty "{}"
```
![](/assets/mbed_18.png)
หลอดไฟสีเหลืองที่ board จะติดขึ้นมา หากใช้คำสั่งเดิมอีกครั้งหลอดไฟจะดับ
![](/assets/mbed_19.png)

จากนี้เราสามารถเขียนโปรแกรม mbed board โดยใช้ภาษา C++ ซึ่งสามารถทำตาม Tutorials ได้จากลิ้งค์นี้ [http://wiki.ros.org/rosserial_mbed/Tutorials](http://wiki.ros.org/rosserial_mbed/Tutorials)
![](/assets/mbed_20.png)






