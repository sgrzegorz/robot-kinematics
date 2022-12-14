
close all;
clear all;
clc;
% 
% figure
% [theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6] = setDefaultParameters1()
% hold on
% for theta1=0:pi/12:2*pi
%     [x,y,z] = calcLocation(theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
%     H = DenavitHartenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
%     plot(x,y,'*');
% end
% hold off
% 
% figure
% [theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6] = setDefaultParameters1()
% hold on
% for theta2=0:pi/12:2*pi
%     [x,y,z] = calcLocation(theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
% 
%     H = DenavitHartenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
% 
%     plot(x,y,'*');
% end
% hold off


% Robot movement depending on drives
parameterNames={'theta1','theta2','theta3','theta4','theta5','theta6','a1','a2','a3','a4','a5','a6'}
for i=1:6
    figure
    parameter = setDefaultParameters();
    hold on
    for j=0:pi/12:2*pi
        parameter(i) = j
        [x,y,z] = calcLocation(parameter(1), parameter(2), parameter(3),parameter(4),parameter(5),parameter(6),parameter(7),parameter(8),parameter(9),parameter(10),parameter(11),parameter(12));

        H = DenavitHartenberg(parameter(1), parameter(2), parameter(3),parameter(4),parameter(5),parameter(6),parameter(7),parameter(8),parameter(9),parameter(10),parameter(11),parameter(12));

        plot(x,y,'*');
        title(parameterNames{i})
    end
    hold off
end


figure
[theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6] = setDefaultParameters1();
hold on
step = pi/3;
for theta1=0:step:2*pi
    for theta2=0:step:2*pi
        for theta3=0:step:2*pi
            for theta4=0:step:2*pi
%                 for theta5=0:step:2*pi
%                     for theta6=0:step:2*pi

                        [x,y,z] = calcLocation(theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
                        H = DenavitHartenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
%                         x = H(1,4);
%                         y =H(2,4);
%                         z = H(3,4);


                        plot3(x,y,z, '*');
%                     end
%                 end
            end
        end
    end     
end
hold off



function [x,y,z] = calcLocation(theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6)
    x =a2 + a3 + a4 + a6*cos(theta5)*cos(theta6);
    y = a6*cos(theta6)*sin(theta5)*(cos(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)) - sin(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2))) - sin(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)) + sin(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)))) - a5*(cos(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)) + sin(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2))) + sin(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)) - sin(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)))) - a6*sin(theta6)*(cos(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)) + sin(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2))) + sin(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)) - sin(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)))) - a1*cos(theta1 - pi/2);
    z = a5*(cos(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)) - sin(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2))) - sin(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)) + sin(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)))) - a1*sin(theta1 - pi/2) + a6*sin(theta6)*(cos(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)) - sin(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2))) - sin(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)) + sin(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)))) + a6*cos(theta6)*sin(theta5)*(cos(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2)) + sin(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2))) + sin(theta4)*(cos(theta3)*(cos(theta1 - pi/2)*cos(theta2 + pi/2) - sin(theta1 - pi/2)*sin(theta2 + pi/2)) - sin(theta3)*(cos(theta1 - pi/2)*sin(theta2 + pi/2) + cos(theta2 + pi/2)*sin(theta1 - pi/2))));
end



function [theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6] =setDefaultParameters1()
    theta1 = pi/2;
    theta2 = pi/2; 
    theta3 = pi/2;
    theta4 = pi/2;
    theta5 = pi/2; 
    theta6= pi/2; 
    
    a1 =0.5;
    a2 = 0.5;
    a3 = 0.5;
    a4  =0.5;
    a5 = 0.5;
    a6=0.5;
end


function [parameter] =setDefaultParameters()
    [theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6] = setDefaultParameters1();
    parameter = [theta1,theta2,theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6];
end



function [H] = DenavitHartenberg(theta1, theta2, theta3,theta4,theta5,theta6,a1,a2,a3,a4,a5,a6);
    % Rz()*Tz()*Tx()*Rx()
    A11 = Rz(-pi/2)*Tz(0)*Tx(0)*Rx(-pi/2);
    A12 = Rz(-pi/2+theta1)*Tz(a1)*Tx(0)*Rx(0);
    A21 = Rz(0)*Tz(0)*Tx(0)*Rx(pi/2);
    A22 = Rz(pi/2+theta2)*Tz(0)*Tx(a2)*Rx(0);
    A31 = Rz(theta3)*Tz(0)*Tx(a3)*Rx(0);
    A41 = Rz(theta4)*Tz(0)*Tx(a4)*Rx(0);
    A51 = Rz(0)*Tz(0)*Tx(0)*Rx(pi/2);
    A52 = Rz(theta5)*Tz(0)*Tx(a5)*Rx(0);
    A61 = Rz(pi/2)*Tz(0)*Tx(0)*Rx(pi/2);
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

