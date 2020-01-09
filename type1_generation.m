%% Clean the workspace
clc
clear all
close all

%% Define constants
a0 = -2;
a1 = -1;
a2 = 0;
a3 = 1;
a4 = 2;

c1 = -1;
c2 = -1;
c3 = 0;
c4 = 1;
c5 = 1;

%% Define functions
syms sigma1 sigma2 x

assume(sigma1 >= -1 & sigma1 <= 1)
assume(sigma2 >= -1 & sigma2 <= 1)

C1 = c1;
C2 = c2;
C3 = c3;
C4 = c2;
C5 = c3;
C6 = c4;
C7 = c3;
C8 = c4;
C9 = c5;

mu11(sigma1) = max1(min1((sigma1 - a0)/(a1 - a0), (a2 - sigma1)/(a2 - a1)), 0);
mu12(sigma1) = max1(min1((sigma1 - a1)/(a2 - a1), (a3 - sigma1)/(a3 - a2)), 0);
mu13(sigma1) = max1(min1((sigma1 - a2)/(a3 - a2), (a4 - sigma1)/(a4 - a3)), 0);

mu21(sigma2) = max1(min1((sigma2 - a0)/(a1 - a0), (a2 - sigma2)/(a2 - a1)), 0);
mu22(sigma2) = max1(min1((sigma2 - a1)/(a2 - a1), (a3 - sigma2)/(a3 - a2)), 0);
mu23(sigma2) = max1(min1((sigma2 - a2)/(a3 - a2), (a4 - sigma2)/(a4 - a3)), 0);

f1(sigma1, sigma2) = prod1(mu11(sigma1), mu21(sigma2));
f2(sigma1, sigma2) = prod1(mu11(sigma1), mu22(sigma2));
f3(sigma1, sigma2) = prod1(mu11(sigma1), mu23(sigma2));
f4(sigma1, sigma2) = prod1(mu12(sigma1), mu21(sigma2));
f5(sigma1, sigma2) = prod1(mu12(sigma1), mu22(sigma2));
f6(sigma1, sigma2) = prod1(mu12(sigma1), mu23(sigma2));
f7(sigma1, sigma2) = prod1(mu13(sigma1), mu21(sigma2));
f8(sigma1, sigma2) = prod1(mu13(sigma1), mu22(sigma2));
f9(sigma1, sigma2) = prod1(mu13(sigma1), mu23(sigma2));

phi(sigma1, sigma2) = simplify((...
    f1(sigma1, sigma2) * C1 + f2(sigma1, sigma2) * C2 + f3(sigma1, sigma2) * C3 + ...
    f4(sigma1, sigma2) * C4 + f5(sigma1, sigma2) * C5 + f6(sigma1, sigma2) * C6 + ...
    f7(sigma1, sigma2) * C7 + f8(sigma1, sigma2) * C8 + f9(sigma1, sigma2) * C9) / ...
    (f1(sigma1, sigma2) + f2(sigma1, sigma2) + f3(sigma1, sigma2) + f4(sigma1, sigma2) + f5(sigma1, sigma2) + f6(sigma1, sigma2) + f7(sigma1, sigma2) + f8(sigma1, sigma2) + f9(sigma1, sigma2)))

latex(phi)

figure
fsurf(phi, [-1 1 -1 1]);
axis([-1 1 -1 1 -1 1]);
xlabel('$\sigma_1$', 'interpreter', 'latex', 'fontsize', 20);
ylabel('$\sigma_2$', 'interpreter', 'latex', 'fontsize', 20);
zlabel('$\varphi^{\mathrm{T1}}(\sigma_1, \sigma_2)$', 'interpreter', 'latex', 'fontsize', 20);

%% Test

[...
eval(phi(-1, 1)), eval(phi(-0.5, 1)), eval(phi(0, 1)), eval(phi(0.5, 1)), eval(phi(1, 1)); ...
eval(phi(-1, 0.5)), eval(phi(-0.5, 0.5)), eval(phi(0, 0.5)), eval(phi(0.5, 0.5)), eval(phi(1, 0.5));
eval(phi(-1, 0)), eval(phi(-0.5, 0)), eval(phi(0, 0)), eval(phi(0.5, 0)), eval(phi(1, 0)); ...
eval(phi(-1, -0.5)), eval(phi(-0.5, -0.5)), eval(phi(0, -0.5)), eval(phi(0.5, -0.5)), eval(phi(1, -0.5)); ...
eval(phi(-1, -1)), eval(phi(-0.5, -1)), eval(phi(0, -1)), eval(phi(0.5, -1)), eval(phi(1, -1))]

%% Plot

figure(1);

grid on;
hold on;

h1 = fsurf(phi, [-1 1 -1 1]);

set(gca, 'fontsize', 15);
set(gca, 'XTick', [-1 -0.5 0 0.5 1]);
set(gca, 'YTick', [-1 -0.5 0 0.5 1]);
set(gca, 'TickLabelInterpreter', 'latex');

xlabel('$\sigma_1$', 'interpreter', 'latex', 'fontsize', 20);
ylabel('$\sigma_2$', 'interpreter', 'latex', 'fontsize', 20);
zlabel('$\varphi^{\mathrm{T1}}(\sigma_1, \sigma_2)$', 'interpreter', 'latex', 'fontsize', 20);

view(-45, 45);

% print('type1_cs.pdf', '-dpdf', '-r600');
% print('type1_cs.eps', '-depsc', '-r600');

%% Analisys

d_phi1(sigma1, sigma2) = simplify(diff(phi(sigma1, sigma2), sigma1))
d_phi2(sigma1, sigma2) = simplify(diff(phi(sigma1, sigma2), sigma2))

figure(2)
fsurf(d_phi1, [-1 1 -1 1]);
axis([-1 1 -1 1 -1 1]);
xlabel('$\sigma_1$', 'interpreter', 'latex', 'fontsize', 20);
ylabel('$\sigma_2$', 'interpreter', 'latex', 'fontsize', 20);
zlabel('$\frac{\partial \varphi^{\mathrm{T1}}}{\partial \sigma_1}$', 'interpreter', 'latex', 'fontsize', 20);

figure(3)
fsurf(d_phi2, [-1 1 -1 1]);
axis([-1 1 -1 1 -1 1]);
xlabel('$\sigma_1$', 'interpreter', 'latex', 'fontsize', 20);
ylabel('$\sigma_2$', 'interpreter', 'latex', 'fontsize', 20);
zlabel('$\frac{\partial \varphi^{\mathrm{T1}}}{\partial \sigma_2}$', 'interpreter', 'latex', 'fontsize', 20);