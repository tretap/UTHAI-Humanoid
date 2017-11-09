# การประมาณตำแหน่งด้วยความน่าจะเป็น \(Probabillistic approach\)

## Kalman Filter

คาลมาน ฟิลเตอร์\(KF\) เป็นวิธีการประมาณค่าของตัวแปรสถานะ\(state\) ที่ได้จากการวัดซึ่งอาจมีความผิดพลาด\(Error\) จากสัญญาณรบกวน\(Noise\)หรือมีความไม่แม่นยำในการวัด Rudolf E. Kalman เป็นนักวิจัยที่เสนอวิธีการนี้เพื่อใช้ในการกรองสัญญาณที่มีความไม่ต่อเนื่องในปี 1960 จึงทำให้มีชื่อเรียกว่า Kalman Filter

กระบวนการของ KF จะแบ่งออกเป็นสองขั้นตอนคือ

1. ขั้นตอนการทำนาย \(Prediction step\)
2. ขั้นตอนการวัด \(Measurement step\)

ใน Prediction step เราจะคำนวณค่าของ state จากแบบจำลองทางพลศาสตร์ของระบบ\(Model\) โดยมีการคำนวณค่าความแปรปรวน\(Varient\)ของ State ซึ่งเป็นผลมาจากค่าสัญญาณรบกวนที่เกิดขึ้นในระบบ\(Process noise\)

ใน Measurement step ค่าของ state จะได้รับการอัพเดตจากค่าที่วัดได้จากเซนเซอร์ซึ่งจะมีการกำหนดค่าสัญญาณรบกวนของการวัด\(Measurement noise\) ค่าของ state จะถูกถ่วงน้ำหนักระหว่างค่าที่ได้จากการคำนวณใน prediction step และค่าจากการวัดด้วยเซนเซอร์ใน measurement step ด้วยค่าที่มีความน่าเชื่อถือมากกว่า ค่าที่คำนวณออกมาจะอยู่ในรูปของ Kalman Gain

กระบวนการของ KF จะทำเป็น iterative จนค่าของ state ลู่เข้าหาค่าที่แท้จริง

### Linear

$$ X_{k+1} = AX_k + BU_k+W_{k} $$

$$ Z_k = H_k + W $$

### Nonlinear

$$ X_{k+1} = f(X_k,U_k,W_k) $$

$$ Z_k = h(X_k,N) $$

จะแปลงจาก Nonlinear -&gt; Linear

จะใช้การทำ Partial Derivative Gradian

$$ A = \partial f / \partial X_k $$

## Extended Kalman Filter \[EKF\]



