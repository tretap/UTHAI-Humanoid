# The STM32 board

ถ้าการใช้ Arduino ไม่เพียงพอต่อการใช้ในหุ่นยนต์ของเรา ไม่ต้องห่วง ในปัจจุบันมี ARM-based controller boards อยู่มากมาย เช่น STM32 microcontroller based ที่เรียกว่า NUCLEO

The STM32 is a family of 32-bit microcontrollers from a company

called STMicroelectronics \( [http://www.st.com/content/st\_com/en.html](http://www.st.com/content/st_com/en.html) \). They

manufacture microcontrollers based on different ARM architectures, such as the Cortex-M

series. The STM32 controllers offer a lot more clock speed than Arduino boards. The range

of STM32 controllers are from 24 MHz to 216 MHz, and the flash memory sizes are from 16

KB to 2 MB. In short, STM32 controllers offer a stunning configuration with a wider range

of features than the Arduino. Most boards work at 3.3V and have a wide range of

functionalities on the GPIO pins.

The STM32 boards are not more popular in the hobby/DIY community than the Arduino,

but they are mainly used in high-end robot controllers. Here is an STM 32 Nucleo board:

Interfacing STM32 boards to ROS using mbed

If Arduino is not enough for your application, the STM 32 boards are ready to serve you. To

demonstrate ROS interfacing, we are going to use an STM 32 NUCLEO L476RG

\( [https://developer.mbed.org/platforms/ST-Nucleo-L476RG/](https://developer.mbed.org/platforms/ST-Nucleo-L476RG/) \). Before we begin

programming, let's understand the mbed platform. The mbed platform is a software

platform for programming 32-bit ARM Cortex-M microcontrollers. The mbed platform

developed as a collaborative project by ARM its technology partners. We can use the online

mbed IDE or offline compilers for programming the boards. The advantage of using the

online IDE is it will be updated and will have more hardware support.



### เริ่มเขียนโปรแกรมโดยใช้ STM32 board

1. สมัครสมาชิกที่เว็บไซต์ mbed
[https://os.mbed.com/](https://os.mbed.com/)

1. หลังจากสมัครสมาชิกเสร็จแล้ว เข้าไปดู board ที่ระบบรองรับ
[https://os.mbed.com/platforms/](https://os.mbed.com/platforms/)

1. เราจะเลือก board ของเราได้จากหน้านี้ ในที่นี้เราจะเลือก NUCLEO F411RE board
![](/assets/mbed_1.png)
หรือเข้าไปที่หน้านี้ [https://os.mbed.com/platforms/ST-Nucleo-F411RE/](https://os.mbed.com/platforms/ST-Nucleo-F411RE/)
![](/assets/mbed_2.png)

1. เราจะเห็นปุ่มYou can see an option called Add to your mbed compiler on the right-hand side

of this page. You have to click on this button to add this board to the mbed

compiler. We can add any number of boards to the mbed compiler; also, we can

choose the board before compiling.

1. After adding the board to the compiler, we can compile a ROS node for this

board. As we've already discussed, we can program the board using the online

IDE or an offline compiler such as gcc4embed

\( [https://github.com/adamgreen/gcc4mbed](https://github.com/adamgreen/gcc4mbed) \). Using offline compilers, we can

only program a limited number of boards, but the online IDE can handle the

latest boards.

1. The programming APIs of the ROS node in STM 32 are the same as those for

Arduino, only the environment and tools are different.

1. The online ros\_lib files for mbed are available at

[https://developer.mbed.org/users/garyservin/code/](https://developer.mbed.org/users/garyservin/code/) . You can find ros\_lib

for the Kinetic, Jade, and Indigo versions. You can try with the ROS version you

are working on.

1. You can look at Hello World code for each ROS distribution from the preceding

link.

1. You can import the code into the compiler using the following option:

2. This will open the source code in the mbed online IDE, as shown in the next

screenshot. Here, we are testing with Hello World code for ROS Indigo.

1. The area marked 1 is the board we have added to the compiler. Area 2 is

imported source code and ros\_lib for mbed, and area 3 is the button to compile

the source code. You can see the debugging details at the bottom of the compiler:

1. The APIs are the same as those of Arduino we saw in the previous section. In this

code, we are publishing a string message, Hello from STM32 NUCLEO , to a

topic called /chatter . You can display this string on a PC by running the ROS

serial server.

1. Click on the Compile button to download the binary file, which can be copied to

the board. Plug the board to your PC, and you will see a flash drive of the board.

You can copy the downloaded binary file to the flash storage, as shown here:

1. When we copy the binary file, the board will automatically start running it. Now,

the procedures have been completed. Just start the ROS server on the PC side to

display topics from the board.

1. Start roscore :

$ roscore

1. Start the ROS server:

$ rosrun rosserial\_python serial\_node.py /dev/ttyACM0

1. Now you can echo the topic using the following command:

$ rostopic echo /chatter

1. You will get following messages on the Terminal:



