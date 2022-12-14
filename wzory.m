% syms theta1 theta2
% t1=[cos(theta1) -sin(theta1) 0 0;sin(theta1) cos(theta1) 0 0;0 0 1 0;0 0 0 1];
% t2=[cos(theta2) -sin(theta2) 0 0;sin(theta2) cos(theta2) 0 0;0 0 1 0;0 0 0 1];
% p=t1*t2;
% why sym(pi)?
% > https://www.mathworks.com/matlabcentral/answers/423805-strange-output-using-symbols-in-a-matrix
syms theta1 theta2 theta3 theta4 theta5 theta6 a1 a2 a3 a4 a5 a6
 

H = DenavitHartenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);


x = H(1,4)
y = H(2,4)
z = H(3,4)

function [H] = DenavitHartenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
    % Rz()*Tz()*Tx()*Rx()
    A11 = Rz(-sym(pi)/2)*Tz(0)*Tx(0)*Rx(-sym(pi)/2);
    A12 = Rz(-sym(pi)/2+theta1)*Tz(a1)*Tx(0)*Rx(0);
    A21 = Rz(0)*Tz(0)*Tx(0)*Rx(sym(pi)/2);
    A22 = Rz(sym(pi)/2+theta2)*Tz(0)*Tx(a2)*Rx(0);
    A31 = Rz(theta3)*Tz(0)*Tx(a3)*Rx(0);
    A41 = Rz(theta4)*Tz(0)*Tx(a4)*Rx(0);
    A51 = Rz(0)*Tz(0)*Tx(0)*Rx(sym(pi)/2);
    A52 = Rz(theta5)*Tz(0)*Tx(a5)*Rx(0);
    A61 = Rz(sym(pi)/2)*Tz(0)*Tx(0)*Rx(sym(pi)/2);
    A62 = Rz(theta6)*Tz(a6)*Tx(0)*Rx(0);
    H = A11*A12*A22*A31*A41*A51*A52*A61*A62;
end


function [A] = Rz(theta)
    A = [cos(theta),-sin(theta),0 0; sin(theta),cos(theta) 0 0; 0 0 1 0; 0  0 0 1];
end

function [A] = Tx(a)
    A = [1 0 0 0; 0 1 0 0; 0 0 1 a; 0 0 0 1];
end

function [A] = Tz(a)
    A = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
end

function [A] = Rx(theta)
    A = [1 0 0 0; 0 cos(theta) -sin(theta) 0; 0 sin(theta) cos(theta) 0; 0 0 0 1];
end
