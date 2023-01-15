clear all

% a1 = 0.5;
% a2 = 0.5;
% a3 = 0.5;
% a4 = 0.5;
% a5 = 0.5;
% a6 = 0.5;

a1 = sym('a1');
a2 = sym('a2');
a3 = sym('a3');
% a4 = sym('a4');
% a5 = sym('a5');
% a6 = sym('a6');

th1 = sym('th1');
th2 = sym('th2');
th3 = sym('th3');
% th4 = sym('th4');
% th5 = sym('th5');
% th6 = sym('th6');

%macierz 0->1
RZ1 = [0 1 0 0; -1 0 0 0; 0 0 1 0; 0 0 0 1]; %git
RX1 = [1 0 0 0; 0 0 1 0; 0 -1 0 0; 0 0 0 1]; %git
RZ1_2 = [sin(th1) cos(th1) 0 0; -cos(th1) sin(th1) 0 0; 0 0 1 0; 0 0 0 1]; %git
TZ = [1 0 0 0; 0 1 0 0; 0 0 1 a1; 0 0 0 1]; %git

% %macierz 1->2
RX2 = [1 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 1]; %git
RZ2 = [-sin(th2) -cos(th2) 0 0; cos(th2) -sin(th2) 0 0; 0 0 1 0; 0 0 0 1]; %git
TX2 = [1 0 0 a2; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %git
 
% % macierz 2->3 git
RZ3 = [cos(th3) -sin(th3) 0 0; sin(th3) cos(th3) 0 0; 0 0 1 0; 0 0 0 1]; %git  
TX3 = [1 0 0 a3; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %git

% % % macierz 3->4 git
% RZ4 = [cos(th4) -sin(th4) 0 0; sin(th4) cos(th4) 0 0; 0 0 1 0; 0 0 0 1]; %git
% TX4 = [1 0 0 a4; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %git
% 
% % %macierz 4->5
% RX5 = [1 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 1]; %git
% RZ5 = [cos(th5) -sin(th5) 0 0; sin(th5) cos(th5) 0 0; 0 0 1 0; 0 0 0 1]; %git
% TX5 = [1 0 0 a5; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %git
% 
% % %macierz 5->6
% RZ6 = [0 -1 0 0; 1 0 0 0; 0 0 1 0; 0 0 0 1]; %git
% RX6 = [1 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 1]; %git
% RZ6_2 = [cos(th6) -sin(th6) 0 0; sin(th6) cos(th6) 0 0; 0 0 1 0; 0 0 0 1]; %git
% TZ6 = [1 0 0 0; 0 1 0 0; 0 0 1 a6; 0 0 0 1]; %git

A01 = RZ1*RX1*RZ1_2*TZ;
A02 = RX2*RZ2*TX2;
A03 = RZ3*TX3;
% A04 = RZ4*TX4;
% A05 = RX5*RZ5*TX5;
% A06 = RZ6*RX6*RZ6_2*TZ6;


A07=A01*A02*A03
% A08 = RZ1*RX1*RZ1_2*TZ*RX2*RZ2*TX2*RZ3*TX3*RZ4*TX4*RX5*RZ5*TX5*RZ6*RX6*RZ6_2*TZ6

x = A07(1,4)
% x_2 = A08(1,4)

y = A07(2,4)
% y_2 = A08(2,4)

z = A07(3,4)
% z_2 = A08(3,4)