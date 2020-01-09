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
c2 = 0;
c3 = 1;

%% Define functions
syms sigma1 sigma2 alpha1 alpha2 x

assume(sigma1 >= -1 & sigma1 <= 1)
assume(sigma2 >= -1 & sigma2 <= 1)
assume(alpha1 >= 0 & alpha1 <= 1)
assume(alpha2 >= 0 & alpha2 <= 1)

C1 = c1;
C2 = c1;
C3 = c1;
C4 = c2;
C5 = c2;
C6 = c2;
C7 = c3;
C8 = c3;
C9 = c3;

m11 = alpha1;
m12 = alpha1;
m13 = alpha1;

m21 = alpha2;
m22 = alpha2;
m23 = alpha2;

muU11(sigma1) = max1(min1((sigma1 - a0)/(a1 - a0), (a2 - sigma1)/(a2 - a1)), 0);
muU12(sigma1) = max1(min1((sigma1 - a1)/(a2 - a1), (a3 - sigma1)/(a3 - a2)), 0);
muU13(sigma1) = max1(min1((sigma1 - a2)/(a3 - a2), (a4 - sigma1)/(a4 - a3)), 0);
muL11(sigma1) = m11 * muU11(sigma1);
muL12(sigma1) = m12 * muU12(sigma1);
muL13(sigma1) = m13 * muU13(sigma1);

muU21(sigma2) = max1(min1((sigma2 - a0)/(a1 - a0), (a2 - sigma2)/(a2 - a1)), 0);
muU22(sigma2) = max1(min1((sigma2 - a1)/(a2 - a1), (a3 - sigma2)/(a3 - a2)), 0);
muU23(sigma2) = max1(min1((sigma2 - a2)/(a3 - a2), (a4 - sigma2)/(a4 - a3)), 0);
muL21(sigma2) = m21 * muU21(sigma2);
muL22(sigma2) = m22 * muU22(sigma2);
muL23(sigma2) = m23 * muU23(sigma2);

fU1(sigma1, sigma2) = prod1(muU11(sigma1), muU21(sigma2));
fU2(sigma1, sigma2) = prod1(muU11(sigma1), muU22(sigma2));
fU3(sigma1, sigma2) = prod1(muU12(sigma1), muU21(sigma2));
fU4(sigma1, sigma2) = prod1(muU11(sigma1), muU23(sigma2));
fU5(sigma1, sigma2) = prod1(muU12(sigma1), muU22(sigma2));
fU6(sigma1, sigma2) = prod1(muU13(sigma1), muU21(sigma2));
fU7(sigma1, sigma2) = prod1(muU12(sigma1), muU23(sigma2));
fU8(sigma1, sigma2) = prod1(muU13(sigma1), muU22(sigma2));
fU9(sigma1, sigma2) = prod1(muU13(sigma1), muU23(sigma2));
fL1(sigma1, sigma2) = prod1(muL11(sigma1), muL21(sigma2));
fL2(sigma1, sigma2) = prod1(muL11(sigma1), muL22(sigma2));
fL3(sigma1, sigma2) = prod1(muL12(sigma1), muL21(sigma2));
fL4(sigma1, sigma2) = prod1(muL11(sigma1), muL23(sigma2));
fL5(sigma1, sigma2) = prod1(muL12(sigma1), muL22(sigma2));
fL6(sigma1, sigma2) = prod1(muL13(sigma1), muL21(sigma2));
fL7(sigma1, sigma2) = prod1(muL12(sigma1), muL23(sigma2));
fL8(sigma1, sigma2) = prod1(muL13(sigma1), muL22(sigma2));
fL9(sigma1, sigma2) = prod1(muL13(sigma1), muL23(sigma2));

fl1(sigma1, sigma2) = fU1(sigma1, sigma2);
fl2(sigma1, sigma2) = fU2(sigma1, sigma2);
fl3(sigma1, sigma2) = fU3(sigma1, sigma2);
fl4(sigma1, sigma2) = fL4(sigma1, sigma2);
fl5(sigma1, sigma2) = fL5(sigma1, sigma2);
fl6(sigma1, sigma2) = fL6(sigma1, sigma2);
fl7(sigma1, sigma2) = fL7(sigma1, sigma2);
fl8(sigma1, sigma2) = fL8(sigma1, sigma2);
fl9(sigma1, sigma2) = fL9(sigma1, sigma2);
fr1(sigma1, sigma2) = fU1(sigma1, sigma2);
fr2(sigma1, sigma2) = fU2(sigma1, sigma2);
fr3(sigma1, sigma2) = fU3(sigma1, sigma2);
fr4(sigma1, sigma2) = fU4(sigma1, sigma2);
fr5(sigma1, sigma2) = fU5(sigma1, sigma2);
fr6(sigma1, sigma2) = fU6(sigma1, sigma2);
fr7(sigma1, sigma2) = fL7(sigma1, sigma2);
fr8(sigma1, sigma2) = fL8(sigma1, sigma2);
fr9(sigma1, sigma2) = fL9(sigma1, sigma2);

% [   eval(subs(fL1(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU1(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL2(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU2(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL3(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU3(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL4(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU4(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL5(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU5(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL6(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU6(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL7(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU7(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL8(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU8(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])); ...
%     eval(subs(fL9(0.5, 0.5), [alpha1 alpha2], [0.5 0.5])), eval(subs(fU9(0.5, 0.5), [alpha1 alpha2], [0.5 0.5]))]

phi(sigma1, sigma2) = ...
    simplify(1/2 * (fl1(sigma1, sigma2) * C1 + fl2(sigma1, sigma2) * C2 + fl3(sigma1, sigma2) * C3 + fl4(sigma1, sigma2) * C4 + fl5(sigma1, sigma2) * C5 + fl6(sigma1, sigma2) * C6 + fl7(sigma1, sigma2) * C7 + fl8(sigma1, sigma2) * C8 + fl9(sigma1, sigma2) * C9)/...
    (fl1(sigma1, sigma2) + fl2(sigma1, sigma2) + fl3(sigma1, sigma2) + fl4(sigma1, sigma2) + fl5(sigma1, sigma2) + fl6(sigma1, sigma2) + fl7(sigma1, sigma2) + fl8(sigma1, sigma2) + fl9(sigma1, sigma2)) + ...
     1/2 * (fr1(sigma1, sigma2) * C1 + fr2(sigma1, sigma2) * C2 + fr3(sigma1, sigma2) * C3 + fr4(sigma1, sigma2) * C4 + fr5(sigma1, sigma2) * C5 + fr6(sigma1, sigma2) * C6 + fr7(sigma1, sigma2) * C7 + fr8(sigma1, sigma2) * C8 + fr9(sigma1, sigma2) * C9)/...
     (fr1(sigma1, sigma2) + fr2(sigma1, sigma2) + fr3(sigma1, sigma2) + fr4(sigma1, sigma2) + fr5(sigma1, sigma2) + fr6(sigma1, sigma2) + fr7(sigma1, sigma2) + fr8(sigma1, sigma2) + fr9(sigma1, sigma2)), 'Steps', 10)

% latex(phi)

phi_l(sigma1, sigma2) = ...
    simplify((fl1(sigma1, sigma2) * C1 + fl2(sigma1, sigma2) * C2 + fl3(sigma1, sigma2) * C3 + fl4(sigma1, sigma2) * C4 + fl5(sigma1, sigma2) * C5 + fl6(sigma1, sigma2) * C6 + fl7(sigma1, sigma2) * C7 + fl8(sigma1, sigma2) * C8 + fl9(sigma1, sigma2) * C9)/...
    (fl1(sigma1, sigma2) + fl2(sigma1, sigma2) + fl3(sigma1, sigma2) + fl4(sigma1, sigma2) + fl5(sigma1, sigma2) + fl6(sigma1, sigma2) + fl7(sigma1, sigma2) + fl8(sigma1, sigma2) + fl9(sigma1, sigma2)), 'Steps', 10)

% latex(phi_l)

phi_r(sigma1, sigma2) = ...
    simplify((fr1(sigma1, sigma2) * C1 + fr2(sigma1, sigma2) * C2 + fr3(sigma1, sigma2) * C3 + fr4(sigma1, sigma2) * C4 + fr5(sigma1, sigma2) * C5 + fr6(sigma1, sigma2) * C6 + fr7(sigma1, sigma2) * C7 + fr8(sigma1, sigma2) * C8 + fr9(sigma1, sigma2) * C9)/...
     (fr1(sigma1, sigma2) + fr2(sigma1, sigma2) + fr3(sigma1, sigma2) + fr4(sigma1, sigma2) + fr5(sigma1, sigma2) + fr6(sigma1, sigma2) + fr7(sigma1, sigma2) + fr8(sigma1, sigma2) + fr9(sigma1, sigma2)), 'Steps', 10)

% latex(phi_r);
 
%% Test

result_fm = zeros(5, 5);
for i = 1:5
    for j = 1:5
        result_fm(i,j) = eval(subs(phi((i - 3) / 2, (j - 3) / 2), [alpha1 alpha2], [0.5 0.5]));
    end
end
result_fm

%% Plot
      
set_alpha = cellstr(['0.01'; '0.04'; '0.09'; '0.16'; '0.25'; '0.36'; '0.49'; '0.64'; '0.81'])';

for a = set_alpha
        
        figure('Name', 'CCs-3D', 'NumberTitle', 'off');
        
        grid on;
        hold on;
        
        h1 = fsurf(subs(phi, [alpha1 * alpha2], [str2double(a)]), [-1 1 -1 1]);
              
        title(strcat('$\alpha =~$', a{1,1}), 'interpreter', 'latex');
        
        set(gca, 'fontsize', 15);
        set(gca, 'XTick', [-1 -0.5 0 0.5 1]);
        set(gca, 'YTick', [-1 -0.5 0 0.5 1]);
        set(gca, 'TickLabelInterpreter', 'latex');
        
        xlabel('$\sigma_1$', 'interpreter', 'latex', 'fontsize', 20);
        ylabel('$\sigma_2$', 'interpreter', 'latex', 'fontsize', 20);
        zlabel('$\varphi^{\mathrm{IT2}}(\sigma_1, \sigma_2)$', 'interpreter', 'latex', 'fontsize', 20);
        
        view(-45,45);
        
%         print(strcat('3d-cc-', a_p{1,1}, '-', a_d{1,1}, '.png'), '-dpng', '-r600');
%         print(strcat('3d-cc-', a_p{1,1}, '-', a_d{1,1}, '.pdf'), '-dpdf', '-r600');

        hold off;
end

%% Analisys

phi_UM(sigma1, sigma2) = (sigma1 + sigma2)/2;
% d_phi(sigma1, sigma2) = phi(sigma1, sigma2);
% d1_phi(sigma1, sigma2) = -phi(-sigma1, -sigma2);
% d_phi(sigma1, sigma2) = diff(phi(sigma1, sigma2));
% d1_phi(sigma1, sigma2) = diff(-phi(-sigma1, -sigma2));
d_phi(sigma1, sigma2) = diff(phi(sigma1, sigma2) - phi_UM(sigma1, sigma2), sigma1)/sqrt(2) + diff(phi(sigma1, sigma2) - phi_UM(sigma1, sigma2), sigma2)/sqrt(2) - 1.5;
d1_phi(sigma1, sigma2) = diff(-phi(-sigma1, -sigma2) - phi_UM(sigma1, sigma2), sigma1)/sqrt(2) + diff(-phi(-sigma1, -sigma2) - phi_UM(sigma1, sigma2), sigma2)/sqrt(2) - 1.5;

% simplify(d_phi(0, 0))
% 
% latex(simplify(d_phi(0, 0)))
% 
% simplify(solve(d_phi(0, 0) == 0, alpha1))
% simplify(solve(d_phi(0, 0) == 0, alpha2))
% simplify(solve(d_phi(0, 0) >= 0, alpha1))
% simplify(solve(d_phi(0, 0) <= 0, alpha1))
% 
% latex(simplify(solve(d_phi(0, 0) == 0, alpha1)))

% [...
% eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.1, 0.1])), eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.5, 0.1])), eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.9, 0.1])); ...
% eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.1, 0.5])), eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.5, 0.5])), eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.9, 0.5])); ...
% eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.1, 0.9])), eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.5, 0.9])), eval(subs(d_phi(0, 0), [alpha1, alpha2], [0.9, 0.9]))]