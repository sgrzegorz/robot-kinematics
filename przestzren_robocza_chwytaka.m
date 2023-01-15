close all;
clear all;
clc;

% Zdefiniowanie stałych wartości
a1 = 0.5;
a2 = 0.5;
a3 = 0.5;
a4 = 0.5;
a5 = 0.5;
a6 = 0.5;

% theta1 = sym('th1');
% theta2 = sym('th2');
% theta3 = sym('th3');
% theta4 = sym('th4');
% theta5 = sym('th5');
% theta6 = sym('th6');

X = []; Y = []; Z = [];
step = pi/18;
% Pętle, pozwalające na wykreślenie pełnej trajektorii końcówki roboczej robota

for th1=0:step:2*pi
    for th2=0:step:2*pi
        for th3=0:step:2*pi
            for th4=0:step:2*pi
                for th5=0:step:2*pi

                        x = a1 + a3*(cos(th2)*cos(th3) - sin(th2)*sin(th3)) + a2*cos(th2) + a4*(cos(th4)*(cos(th2)*cos(th3) - sin(th2)*sin(th3)) - sin(th4)*(cos(th2)*sin(th3) + cos(th3)*sin(th2))) + a5*cos(th5)*(cos(th4)*(cos(th2)*cos(th3) - sin(th2)*sin(th3)) - sin(th4)*(cos(th2)*sin(th3) + cos(th3)*sin(th2))) + a6*cos(th5)*(cos(th4)*(cos(th2)*cos(th3) - sin(th2)*sin(th3)) - sin(th4)*(cos(th2)*sin(th3) + cos(th3)*sin(th2)));
                        X = [X x];
                        y = a3*(cos(th2)*sin(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) + a5*(cos(th1)*sin(th5) + cos(th5)*(cos(th4)*(cos(th2)*sin(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) - sin(th4)*(sin(th1)*sin(th2)*sin(th3) - cos(th2)*cos(th3)*sin(th1)))) + a6*(cos(th1)*sin(th5) + cos(th5)*(cos(th4)*(cos(th2)*sin(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) - sin(th4)*(sin(th1)*sin(th2)*sin(th3) - cos(th2)*cos(th3)*sin(th1)))) + a4*(cos(th4)*(cos(th2)*sin(th1)*sin(th3) + cos(th3)*sin(th1)*sin(th2)) - sin(th4)*(sin(th1)*sin(th2)*sin(th3) - cos(th2)*cos(th3)*sin(th1))) + a2*sin(th1)*sin(th2);
                        Y = [Y y];
                        z = a5*(sin(th1)*sin(th5) - cos(th5)*(cos(th4)*(cos(th1)*cos(th2)*sin(th3) + cos(th1)*cos(th3)*sin(th2)) - sin(th4)*(cos(th1)*sin(th2)*sin(th3) - cos(th1)*cos(th2)*cos(th3)))) - a4*(cos(th4)*(cos(th1)*cos(th2)*sin(th3) + cos(th1)*cos(th3)*sin(th2)) - sin(th4)*(cos(th1)*sin(th2)*sin(th3) - cos(th1)*cos(th2)*cos(th3))) - a3*(cos(th1)*cos(th2)*sin(th3) + cos(th1)*cos(th3)*sin(th2)) + a6*(sin(th1)*sin(th5) - cos(th5)*(cos(th4)*(cos(th1)*cos(th2)*sin(th3) + cos(th1)*cos(th3)*sin(th2)) - sin(th4)*(cos(th1)*sin(th2)*sin(th3) - cos(th1)*cos(th2)*cos(th3)))) - a2*cos(th1)*sin(th2);
                        Z = [Z z];
                 
                end 
            end
        end
    end     
end


% Wyrysowanie wszystkich wykresów
figure(1)
plot3(Y, X, Z, 'b'); grid on; xlabel('Y'); ylabel('X'); zlabel('Z'); hold on
figure(2)
plot(Y, X, 'b'); grid on; xlabel('Y'); ylabel('X'); hold on
figure(3)
plot(Z, Y, 'b'); grid on; xlabel('Z'); ylabel('Y'); hold on