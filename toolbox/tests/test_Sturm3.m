%% TEST STURM CLASS

clc;
clear all;
close all;

ell = 0.1094;

P = Poly( [ ...
  0, ...
  0, ...
  88740968089804.640625, ...
  -4915676989941691, ...
  127526512469551888, ...
  -1920443367344816640, ...
  17554326940994666496, ...
  -91691443933113974784, ...
  2.0953255012137562931e+20 ...
] );
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

