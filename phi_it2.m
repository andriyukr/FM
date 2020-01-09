function [phi] = phi_it2(sigma, alpha)
sigma1 = sigma(1);
sigma2 = sigma(2);
alpha1 = alpha(1);
alpha2 = alpha(2);
sigma1 = min(max(sigma1, -1), 1);
sigma2 = min(max(sigma2, -1), 1);
if(sigma2 <= omega12(sigma1, alpha1, alpha2))
    phi = phi1(sigma1, sigma2, alpha1, alpha2);
elseif(sigma2 <= omega23(sigma1, alpha1, alpha2))
    phi = phi2(sigma1, sigma2, alpha1, alpha2);
else
    phi = phi3(sigma1, sigma2, alpha1, alpha2);
end
end

function [phi] = phi1(sigma1, sigma2, alpha1, alpha2)
%phi = - (((abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2))/2 - ((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/2 + ((abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2))/2 + (alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2))/2 + (alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2))/2 + (alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/2)/((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - (sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) + (abs(sigma1) - 1)*(abs(sigma2) - 1) - (abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2)) - (((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/2 + ((abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2))/2 + ((abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2))/2 + (alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2))/2 + (alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2))/2 - (alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/2)/((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(abs(sigma2) - 1) - alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2));
phi = (phi_l3(sigma1, sigma2, alpha1, alpha2) + phi_r3(sigma1, sigma2, alpha1, alpha2)) / 2;
end

function [phi] = phi2(sigma1, sigma2, alpha1, alpha2)
%phi = - (((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/2 + ((abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2))/2 + ((abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2))/2 + (alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2))/2 + (alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2))/2 - (alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/2)/((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(abs(sigma2) - 1) - alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2)) - (((abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2))/2 - ((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/2 + ((abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2))/2 + (alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2))/2 + (alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2))/2 + (alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/2)/((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(abs(sigma2) - 1) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2));
phi = (phi_l3(sigma1, sigma2, alpha1, alpha2) + phi_r6(sigma1, sigma2, alpha1, alpha2)) / 2;
end

function [phi] = phi3(sigma1, sigma2, alpha1, alpha2)
%phi = - (((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/2 + ((abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2))/2 + ((abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2))/2 + (alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2))/2 + (alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2))/2 - (alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/2)/((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - (sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma1) - 1)*(abs(sigma2) - 1) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) - alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2)) - (((abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2))/2 - ((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/2 + ((abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2))/2 + (alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2))/2 + (alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2))/2 + (alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/2)/((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(abs(sigma2) - 1) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2));
phi = (phi_l6(sigma1, sigma2, alpha1, alpha2) + phi_r6(sigma1, sigma2, alpha1, alpha2)) / 2;
end

function [phi_l] = phi_l3(sigma1, sigma2, alpha1, alpha2)
phi_l = -((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(abs(sigma2) - 1) - alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2));
end

function [phi_l] = phi_l6(sigma1, sigma2, alpha1, alpha2)
phi_l = -((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2))/((sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - (sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) + (abs(sigma1) - 1)*(abs(sigma2) - 1) + (abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + (abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) - alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2));
end

function [phi_r] = phi_r3(sigma1, sigma2, alpha1, alpha2)
phi_r = -((abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) + (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - (sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) + (abs(sigma1) - 1)*(abs(sigma2) - 1) - (abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2));
end

function [phi_r] = phi_r6(sigma1, sigma2, alpha1, alpha2)
phi_r = -((abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) + (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2))/((sigma1/2 + abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - (abs(sigma2) - 1)*(sigma1/2 + abs(sigma1)/2) - (abs(sigma1) - 1)*(sigma2/2 + abs(sigma2)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(abs(sigma2) - 1) + alpha1*alpha2*(abs(sigma2) - 1)*(sigma1/2 - abs(sigma1)/2) + alpha1*alpha2*(abs(sigma1) - 1)*(sigma2/2 - abs(sigma2)/2) + alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 - abs(sigma1)/2)*(sigma2/2 + abs(sigma2)/2) - alpha1*alpha2*(sigma1/2 + abs(sigma1)/2)*(sigma2/2 - abs(sigma2)/2));
end

function [omega12] = omega12(sigma1, alpha1, alpha2)
if(sigma1 <= 0)
    omega12 = (-alpha1 * alpha2 * sigma1) / (sigma1 - alpha1 * alpha2 * sigma1 + 1);
else
    omega12 = (-sigma1) / (sigma1 + alpha1 * alpha2 - alpha1 * alpha2 * sigma1);
end
end

function [omega23] = omega23(sigma1, alpha1, alpha2)
if(sigma1 <= 0)
    omega23 = (-sigma1) / (alpha1 * alpha2 - sigma1 + alpha1 * alpha2 * sigma1);
else
    omega23 = (-alpha1 * alpha2 * sigma1) / (alpha1 * alpha2 * sigma1 - sigma1 + 1);
end
end