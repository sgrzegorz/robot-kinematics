% syms theta1 theta2
% t1=[cos(theta1) -sin(theta1) 0 0;sin(theta1) cos(theta1) 0 0;0 0 1 0;0 0 0 1];
% t2=[cos(theta2) -sin(theta2) 0 0;sin(theta2) cos(theta2) 0 0;0 0 1 0;0 0 0 1];
% p=t1*t2;


syms theta1 theta2 theta3 theta4 theta5 theta6 a1 a2 a3 a4 a5 a6
 
A11 = [0 0 1 0; 0 0 0 0; 0 -1 0 0; 0 0 0 1]
A12 = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0; 0 0 1 0; 0 0 0 1]
A21 = [1 0 0 0; 0 cos(sym(pi)/2) -sin(sym(pi)/2) 0 ; 0 sin(sym(pi)/2) cos(sym(pi)/2) 0; 0 0 0 1]
A22 = [cos(theta2) -sin(theta2) 0 a2*cos(theta2); sin(theta2) cos(theta2) 0 a2*sin(theta2); 0 0 1 0; 0 0 0 1]
A3 = [cos(theta3), - sin(theta3), 0, a3*cos(theta3); sin(theta3), cos(theta3), 0, a3*sin(theta3); 0 , 0, 1,0; 0,0,0,1]

A4 = [cos(theta4), -sin(theta4), 0, a4*cos(theta4); sin(theta4), cos(theta4), 0, a4*sin(theta4); 0 0 1 0 ; 0  0 0 1 ]

A51 = [1 0 0 0 ; 0 cos(sym(pi)/2) -sin(sym(pi)/2) 0; 0 sin(sym(pi)/2) cos(sym(pi)/2) 0; 0 0 0 1]

A52 = [cos(theta5), -sin(theta5), 0, a5*cos(theta5); sin(theta5) cos(theta5) 0 a5*sin(theta5); 0 0 1 0; 0 0 0 1]

A61 = [0,0,-1 0; 0 0 0 0; 0 1 0 0; 0 0 0 1];

A62 = [cos(theta6) -sin(theta6) 0 0; sin(theta6) cos(theta6) 0 0; 0 0 1 a6; 0 0 0 1]; % theta6 = var(theta6)

H = vpa(A11 * A12  * A21 *A22*A3*A4*A51*A52*A61*A62)

x = H(1,4)
y = H(2,4)
z = H(3,4)