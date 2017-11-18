# Converting DH Tables to URDF Model

ในหัวข้อนี้จะเรียนรู้การใช้ RVIZ Robot Simulator และการแปลง DH Tables เป็นไฟล์ URDF



Denivit-Hartenberg \(DH\) เป็นมาตฐานที่จะช่วยให้การคำนวณ Position และ Orientation ของ Frame ที่เป็นแบบ Kinematic Chain ง่ายขึ้น จากหัวข้อก่อนหน้านี้ URDF จะใช้บอก model ของหุ่นยนต์ที่เป็นแบบ Kinematic Trees การใช้ URDF นั้นไม่จำเป็นที่จะให้ Frame หมุนรอบแกน Z เท่านั้น เราสามารถทำให้เป็นข้อต่อแบบ Revolute หรือ Prismatic ได้ตามใจ หมุนรอบแกนไหนก็ได้ อย่างไรก็ตาม เราสามารถที่จะเขียน URDF ให้คล้ายๆกับ DH Parameters ได้





