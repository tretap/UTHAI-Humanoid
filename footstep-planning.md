# **Online ZMP Sampling Search for Biped Walking Planning**

การค้นหาเส้นทางแบบสุ่มในการวางแผนทางเดินของเท้า โดยนำ Linear Inverted Pendulum Dynamic model และ Zero Moment Point มาประยุกต์ใช้เพื่อช่วยแก้ปัญหาของการวางแผนทางเดินของเท้า ซึ่งแผนการเดินนั้นจะมีได้หลายวิธีโดยมีผลมาจากลำดับการเคลื่อนที่ของ ZMP เมื่อหุ่นยนต์เคลื่อนที่อย่างมีเสถียรภาพ

* การปรับเปลี่ยน Random search ให้เป็นแบบ online มีความยาก
* เลือกลำดับ ZMP ที่ส่งผลให้ง่ายต่อการเดิน
* อัลกอรึทิ่มนี้จะทำ online planning ได้เมื่อได้รับแผนการเดินของเท้าที่สามารถเป็นไปได้

การเดินของหุ่นยนต์ฮิวมานอยด์จะมี 2 phase คือ

1. double-support phase
2. single-support phase

ในงานวิจัยนี้รูปแบบการเดินจะถูกพิจารณาจากลำดับของ single-support  phases เพื่อใช้ใน sampling search algorithm

และมุ่งไปที่การเลือก ZMPs ในแต่ละ phases ส่วน double-support phase จะถูกวางแผนในส่วนของ low-level



**โมเดลการตัดสินใจเป็นดังนี้**

1. หุ่นยนต์ฮิวมานอยด์จะถูกพิจารณาให้เป็น linear inveted pendulum ที่มี support อยู่ที่เท้าข้างใดข้างหนึ่ง , มวลของหุ่นยนต์จะคิดจาก CoM ใน horizontal plane ที่มีความสูงจำกัด , ไม่สนใจ inertia
2. วิธีการเดินจะมาจากลำดับของ single-support phases ของหุ่นยนต์ในการก้าวแต่ละครั้ง โดยนับจากขาที่แตะพื้น
3. ขณะที่อยู่ใน single-support phase เราจะใช้ ZMP แค่จุดเดียวในการตัดสินใจ แทนที่จะเป็น ZMP trajectory



Input ของการวางแผนการเดินของเท้าประกอบไปด้วย initial state , final state ของ CoM และแผนการเดินของเท้าจะมี pose และ duration ของแต่ละการก้าว ซึ่งมาจาก high-leven planning \( RRT , A Star ,static footstep lib\)

Output ของแผนการเดินจะเป็นลำดับของ ZMP ที่มาจากการตัดสินใจแล้ว

![](/assets/FP1.png)