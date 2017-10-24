# Create 2D Map

![](/assets/mp1.jpg)

ใช้โปรแกรมวาดรูป เช่นPinta Image Editor

กำหนดความกว้างแผนที่ เช่น50\*10 , 100\*100จากนั้นวาดแผนที่โดยกำหนดให้สีดำเป็นสิ่งกีดขวาง สีขาวเป็นพื้นที่ว่าง

![](/assets/mp2.jpg)

จากนั้นกำหนดคุณสมบัติของแผนที่ไว้ใน.yaml

```yaml
image: map.png 
resolution: 5
# origin: [-12.200000, -13.800000, 0.000000]
origin: [0,0,0]
negate: 0
occupied_thresh: 0.65
free_thresh: 0.196
```

# Genarating Map Node

![](/assets/mp3.jpg)

Map Node คือ ส่วนที่ใช้ในการpublishข้อมูลของแผนที่เพื่อนำไปใช้ในส่วนของNodeการค้นหาเส้นทาง

```
rosrun map_server map_server [ชื่อไฟล์.yaml]
```

เช่น

```
rosrun map_server map_server mymap.yaml
```

จากนั้นจะได้Nodeที่Publishข้อมูลของแผนที่โดยมี

```
msg : nav_msgs/OccupancyGrid

topic : /map
```

service : /static\_map \*\*ใช้ในการรับข้อมูลของแผนที่ครั้งเดียว

# Path Planning Node

เป็น Node ที่รับค่าแผนที่เข้ามาจากนั้นนำมาจัดข้อมูลให้กลายเป็นโครงสร้างแบบ Grid เพื่อใช้ในการค้นหาแบบ A\* Search

