
clc;
clear all;
close all;

w = 0.205;
y = 0.0;

x_c     = 0.0;
y_c     = 0.0;
theta_c = 0.0;

x_c_dot     = 0.0;
y_c_dot     = 0.0;
theta_c_dot = 0.0;

sigma_x = 0.0;
sigma_y = 0.0;
varphi  = 0.5;
V_r     = 15.0;
ell     = 0.11;
psi     = 15.0;

nu     = 0.7;
F_z    = 1.3606e3;
k_x    = 5.8903e7;
k_y    = 22655500;
lambda = 0.0;
Delta  = 0.0;
mu_s   = 1.1962;

% Maple generated code
t1 = ell * ((lambda + 0.15e2 / 0.2e1) * ell + (45 * Delta));
t2 = ell ^ 2;
t3 = theta_c / 0.2e1;
t4 = -(-((0.1e1 - t2 * psi / 0.8e1) * y_c + y + t3 * ell) * varphi + sigma_x) * V_r + x_c_dot;
t5 = V_r + x_c_dot;
t6 = V_r * varphi;
t7 = 4;
t8 = 8;
t9 = t7 * (-psi * t5 * y_c + t6 - theta_c_dot);
t10 = y_c_dot * psi;
t11 = t10 * ell;
t5 = (t9 + t11) * ell + t8 * (V_r * sigma_y + t5 * theta_c - y_c_dot) + 0.16e2 * t6 * x_c;
t8 = 1 / V_r;
t12 = 0.1e1 / ell ^ 2;
t13 = t12 ^ 2;
t13 = t13 ^ 2;
t12 = t12 * t13;
t14 = 0.1e1 / w ^ 2;
t15 = mu_s ^ 2;
t16 = k_x ^ 2;
t17 = t8 ^ 2;
t18 = k_y ^ 2;
t19 = 0.1e1 / nu ^ 2;
t20 = F_z ^ 2;
t21 = t1 ^ 2;
t22 = -0.15e2 - 0.5e1 * lambda;
t23 = ell * t22 - (90 * Delta);
t24 = t23 * ell;
t25 = t1 * t20 * t15 * ell;
t3 = ell * psi * y_c / 0.4e1 - t3;
t9 = -t9 - 0.2e1 * t11;
t11 = -t22;
t22 = 0.2e1 * t1 * t11 + t23 ^ 2;
t26 = t20 * t15;
t27 = varphi ^ 2;
t28 = t11 ^ 2;
CodeGen = [0 0 t17 * (-t16 * t4 ^ 2 - t18 * t5 ^ 2 / 0.64e2) + 0.16e2 / 0.9e1 * t21 * t20 * t15 * t13 * t19 * t14 t8 * (-0.2e1 * t16 * t4 * t3 * varphi - t5 * t9 * t18 * t8 / 0.32e2) - 0.32e2 / 0.9e1 * t25 * (t1 - t24) * t12 * t19 * t14 t17 * (-t16 * t6 * (-t4 * psi * y_c / 0.3e1 + t6 * t3 ^ 2) - t18 * (0.8e1 / 0.3e1 * t10 * t5 + t9 ^ 2) / 0.64e2) + (0.16e2 / 0.9e1 * t26 * (t2 * t22 + t21) - 0.16e2 / 0.9e1 * t25 * t7 * t23) * t12 * t19 * t14 (-t9 * y_c_dot * t18 * t17 / 0.24e2 + t16 * t3 * t27 * y_c / 0.3e1) * psi + 0.32e2 / 0.9e1 * t26 * (-ell * t22 + t23 * (t11 * t2 + t1)) * t12 * t19 * t14 -psi ^ 2 * (t16 * y_c ^ 2 * t27 + y_c_dot ^ 2 * t18 * t17) / 0.36e2 + (0.16e2 / 0.9e1 * t26 * (t2 * t28 + t22) - 0.16e2 / 0.9e1 * t24 * t26 * t7 * t11) * t12 * t19 * t14 0.32e2 / 0.9e1 * t26 * t11 * (-ell * t11 + t23) * t12 * t19 * t14 0.16e2 / 0.9e1 * t26 * t28 * t12 * t19 * t14];

P = Poly(CodeGen);
x_roots = P.real_roots_in_the_interval( 0, ell, 1e-20 )
y_roots = P.eval( x_roots );
y_roots

S = Sturm();
S.build(P);
PP = S.get(1);
z_roots = PP.eval( x_roots );

x = 0.0:0.001:ell;
y = P.eval(x);
z = PP.eval(x);
subplot(2,1,1);
plot(x,y, 'LineWidth', 1.1); hold on;
xlabel('x'); xlabel('y');
xlim([0.0, ell]);
plot(x_roots, y_roots, 'o','MarkerFaceColor','red', 'MarkerSize', 20.0);
grid on; grid minor;
hold off;


subplot(2,1,2);
plot(x,z, 'LineWidth', 2); hold on;
xlabel('x'); xlabel('y');
xlim([0.0, ell]);
plot(x_roots, z_roots, 'o','MarkerFaceColor','red', 'MarkerSize', 20.0);
grid on; grid minor;

