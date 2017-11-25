

### DC Motor Plant Node

Objective: จำลองการทำงานของ DC-motor แบบ real-time

Outcome: ros node ที่รับ /input และส่ง /position

Dynamic system ของ DC-motor สามารถเขียนให้อยู่ในรูปของ state space ได้ดังนี้


$$
\begin{bmatrix}
    \dot{x_{1}} \\
    \dot{x_{2}} \\
    \dot{x_{3}} 
\end{bmatrix}
=
\begin{bmatrix}
    0 & 1 & 0 \\
    0 & -\frac{B}{J} & \frac{K_{m}}{J} \\
    0 & -\frac{K_{b}}{L} & -\frac{R}{L}
\end{bmatrix}
\begin{bmatrix}
    x_{1} \\ x_{2} \\ x_{3} 
\end{bmatrix}
+
\begin{bmatrix}
    0 \\ 0 \\ \frac{1}{L}
\end{bmatrix}
\begin{bmatrix}
    u_{1}
\end{bmatrix}
$$




$$
\begin{bmatrix}
    y_{1}
\end{bmatrix}
=
\begin{bmatrix}
    \frac{1}{r} & 0 & 0 
\end{bmatrix}
\begin{bmatrix}
    x_{1} \\ x_{2} \\ x_{3} 
\end{bmatrix}
+
\begin{bmatrix}
    0
\end{bmatrix}
\begin{bmatrix}
    u_{1}
\end{bmatrix}
$$

$$
\dot{\vec{x}} = f(t,\vec{x},\vec{u})
$$

$$
\vec{y} = g(t,\vec{x},\vec{u})
$$

