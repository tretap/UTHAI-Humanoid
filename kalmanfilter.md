# Kalman Filter

* Linear
* Nomal Distribution

* Non-Linear

### Linear

$$ X_{k+1} = AX_k + BU_k+W_{k} $$

$$ Z_k = H_k + W $$

### Nonlinear

$$ X_{k+1} = f(X_k,U_k,W_k) $$

$$ Z_k = h(X_k,N) $$

จะแปลงจาก Nonlinear -> Linear

จะใช้การทำ Partial Derivative Gradian

$$ A = \partial f / \partial X_k $$


## Extended Kalman Filter [EKF]


