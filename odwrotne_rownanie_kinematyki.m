clear all
% Wybór punktów
P0 = [0.3, 0, 0.3];
P1 = [0.3, 0.5, 0.3];
P2 = [-0.3, -0.3, -0.3];

% Liczba punktów pośrednich w interpolacji (przejścia pomiędzy punktami P0,
% P1,P2)
interp = 10;

% Przejście z punktu P0 do P1
L01 = zeros(interp,3);
L01(1,1) = P0(1)
L01(1,2) = P0(2)
L01(1,3) = P0(3)
L01(interp,1) = P1(1)
L01(interp,2) = P1(2)
L01(interp,3) = P1(3)
qx = (P1(1)-P0(1))/(interp-1);
qy = (P1(2)-P0(2))/(interp-1);
qz = (P1(3)-P0(3))/(interp-1);
for i=2:interp-1
 L01(i,1) = L01(1,1)+(i-1)*qx
 L01(i,2) = L01(1,2)+(i-1)*qy
 L01(i,3) = L01(1,3)+(i-1)*qz
end
% Przejście z punktu P1 do P2
L12 = zeros(interp,3);
L12(1,1) = P1(1)
L12(1,2) = P1(2)
L12(1,3) = P1(3)
L12(interp,1) = P2(1)
L12(interp,2) = P2(2)
L12(interp,3) = P2(3)
qx = (P2(1)-P1(1))/(interp-1);
qy = (P2(2)-P1(2))/(interp-1);
qz = (P2(3)-P1(3))/(interp-1);
for i=2:interp-1
 L12(i,1) = L12(1,1)+(i-1)*qx
 L12(i,2) = L12(1,2)+(i-1)*qy
 L12(i,3) = L12(1,3)+(i-1)*qz
end
% Przejście z punktu P2 do P0
L20 = zeros(interp,3);
L20(1,1) = P2(1)
L20(1,2) = P2(2)
L20(1,3) = P2(3)
L20(interp,1) = P0(1)
L20(interp,2) = P0(2)
L20(interp,3) = P0(3)
qx = (P0(1)-P2(1));
qy = (P0(2)-P2(2))/(interp-1);
qz = (P0(3)-P2(3));
L20(9,3) = 1;
for i=2:interp-1
 L20(i,1) = L20(1,1)+qx*sin((i-1)*pi/(2*interp));
 L20(i,2) = L20(1,2)+(i-1)*qy
 L20(i,3) = L20(interp,3)-qz*cos((i)*pi/(2*interp))
end
% Wykreślenie wykresu na podstawie interpolacji
figure(1)
plot3(L01(:,1),L01(:,2),L01(:,3),'-o'); xlabel('X'); ylabel('Y'); zlabel('Z');
hold on
plot3(L12(:,1),L12(:,2),L12(:,3),'-o')
plot3(L20(:,1),L20(:,2),L20(:,3),'-o')
grid on
hold off
L00 = [L01; L12; L20]

% Zdefiniowanie stałych wartości
a1 = 0.5;
a2 = 0.5;
a3 = 0.5;

th1 = sym('th1');
th2 = sym('th2');
th3 = sym('th3');


%%moje

%MACIERZ 1
RZ1 = [0 1 0 0; -1 0 0 0; 0 0 1 0; 0 0 0 1]; 
RX1 = [1 0 0 0; 0 0 1 0; 0 -1 0 0; 0 0 0 1]; 
RZ1_part_2 = [sin(th1) cos(th1) 0 0; -cos(th1) sin(th1) 0 0; 0 0 1 0; 0 0 0 1]; 
TZ = [1 0 0 0; 0 1 0 0; 0 0 1 a1; 0 0 0 1]; 

%MACIERZ 2 
RX2 = [1 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 1]; 
RZ2 = [-sin(th2) -cos(th2) 0 0; cos(th2) -sin(th2) 0 0; 0 0 1 0; 0 0 0 1];
TX2 = [1 0 0 a2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
 
%MACIERZ 3
RZ3 = [cos(th3) -sin(th3) 0 0; sin(th3) cos(th3) 0 0; 0 0 1 0; 0 0 0 1]; 
TX3 = [1 0 0 a3; 0 1 0 0; 0 0 1 0; 0 0 0 1]; 



A01 = RZ1*RX1*RZ1_part_2*TZ;
A02 = RX2*RZ2*TX2;
A03 = RZ3*TX3;


A04=A01*A02*A03;
% x = A07(1,4)
% y = A07(2,4)
% z = A07(3,4)

x = cos(th2)/2 + (cos(th2)*cos(th3))/2 - (sin(th2)*sin(th3))/2 + 1/2;
 
y = (sin(th1)*sin(th2))/2 + (cos(th2)*sin(th1)*sin(th3))/2 + (cos(th3)*sin(th1)*sin(th2))/2;
 
z = -(cos(th1)*sin(th2))/2 - (cos(th1)*cos(th2)*sin(th3))/2 - (cos(th1)*cos(th3)*sin(th2))/2;

% A04=T01*R12Z*R12X*R12Z_2*T12Z*T12X*R23Z*R23X*R23Z_2*T23X*R34X*R34Z*T34X;


G = zeros(30, 3);
% Zamodelowanie kinematyki odwrotnej
for i = 1:30
 H1 = x == L00(i, 1);
 H2 = y == L00(i, 2);
 H3 = z == L00(i, 3);
 [F1, F2, F3] = solve(H1, H2, H3, th1, th2, th3);
 G(i,1)=F1(1);
 G(i,2)=F2(1);
 G(i,3)=F3(1);
end

N = zeros(30, 3);
for i = 1:30

N(i,1) = cos(G(i,2))/2 + (cos(G(i,2))*cos(G(i,3)))/2 - (sin(G(i,2))*sin(G(i,3)))/2 + 1/2;

N(i,2) = (sin(G(i,1))*sin(G(i,2)))/2 + (cos(G(i,2))*sin(G(i,1))*sin(G(i,3)))/2 + (cos(G(i,3))*sin(G(i,1))*sin(G(i,2)))/2;

N(i,3) = -(cos(G(i,1))*sin(G(i,2)))/2 - (cos(G(i,1))*cos(G(i,2))*sin(G(i,3)))/2 - (cos(G(i,1))*cos(G(i,3))*sin(G(i,2)))/2;

end
figure(2)
plot3(N(:,1),N(:,2),N(:,3),'-o'); xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;