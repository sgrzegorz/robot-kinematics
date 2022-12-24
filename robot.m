
close all
clear all
clc



figure
hold on
for theta3=0:pi/12:2*pi
    a1 =0.5;
    theta1 = pi/2; %var(theta1) - pi/2
    theta2 = pi/2; % var(theta1+pi/2)
    a2 = 0.5;
    a3 = 0.5;
%     theta3 = pi/2;% theta3 = var(theta3)
    theta4 = pi/2;
    a4  =0.5;
    a5 = 0.5;
    theta5 = pi/2; % theta5 = var(theta5)
    a6=0.5;
    theta6= pi/2; 
    
    H = heitenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6)

    x = H(1,4)
    y =H(2,4)
    z = H(3,4)
    plot(x,y);
end
hold off


function setDefaultParameters()
    a1 =0.5;
%     theta1 = pi/2; %var(theta1) - pi/2
    theta2 = pi/2; % var(theta1+pi/2)
    a2 = 0.5;
    a3 = 0.5;
    theta3 = pi/2;% theta3 = var(theta3)
    theta4 = pi/2;
    a4  =0.5;
    a5 = 0.5;
    theta5 = pi/2; % theta5 = var(theta5)
    a6=0.5;
    theta6= pi/2;

end


function [H] = heitenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6)

    A11 = [0,0,1,0 ; 0,0,0,0 ; 0, -1,0,0;0,0,0,1];
    
    
    A12 = [cos(theta1), - sin(theta1), 0 ,0 ; sin(theta1), cos(theta1), 0, 0; 0 ,0,1, a1; 0, 0,0,1];
    
    A21 = [1,0,0,0; 0 cos(pi/2), -sin(pi/2),0 ; 0 , sin(pi/2), cos(pi/2),0;0,0,0,1];
    
     
    A22 = [cos(theta2), -sin(theta2), 0, a2*cos(theta2) ; sin(theta2), cos(theta2), 0, a2*sin(theta2) ; 0,0,1,0 ; 0,0,0, 1];
    
    A3 = [cos(theta3), - sin(theta3), 0, a3*cos(theta3); sin(theta3), cos(theta3), 0, a3*sin(theta3); 0 , 0, 1,0; 0,0,0,1];
    
    A4 = [cos(theta4), -sin(theta4), 0, a4*cos(theta4); sin(theta4), cos(theta4), 0, a4*sin(theta4); 0 0 1 0 ; 0  0 0 1 ];
    
    A51 = [1 0 0 0 ; 0 cos(pi/2) -sin(pi/2) 0; 0 sin(pi/2) cos(pi/2) 0; 0 0 0 1];
    
    A52 = [cos(theta5), -sin(theta5), 0, a5*cos(theta5); sin(theta5) cos(theta5) 0 a5*sin(theta5); 0 0 1 0; 0 0 0 1];
    
    A61 = [0,0,-1 0; 0 0 0 0; 0 1 0 0; 0 0 0 1];
    
    A62 = [cos(theta6) -sin(theta6) 0 0; sin(theta6) cos(theta6) 0 0; 0 0 1 a6; 0 0 0 1]; % theta6 = var(theta6)
    
    H= A11 * A12  * A21 *A22*A3*A4*A51*A52*A61*A62;

end
