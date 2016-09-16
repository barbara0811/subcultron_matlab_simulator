clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% aMUSSELS setup %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%set number of aMussels
M = 6;
%set aMussel communication range
Mr = 20;
%set limits of the environment
xmin = -15; xmax = 15;
ymin = -20; ymax = 20;
zmin = -5; zmax = 0;

%set initial positions of aMussels (here randomly)rng(12);
Mposx = xmin + (xmax - xmin)*rand(1,M);
Mposy = ymin + (ymax - ymin)*rand(1,M);
Mposz = zmin + (zmax - zmin)*rand(1,M);
Mpos_0 = [Mposx; Mposy;  Mposz];

%set amussels initial velocity
Mv_0 = [ones(1,M); zeros(1,M); zeros(1,M)];

%get initial value of adjacancy matrix
MA_0 = zeros(M,M);

for i = 1:M
    for j = 1:M
        distance = sqrt((Mpos_0(1,i)-Mpos_0(1,j))^2 + (Mpos_0(2,i)-Mpos_0(2,j))^2+(Mpos_0(3,i)-Mpos_0(3,j))^2);
        if distance <= Mr
            if i == j
                MA_0(i,j) = 0;
            else
                MA_0(i,j) = 1;
            end
                        
        else
            MA_0(i,j) = 0;
        end 
    end
end

%set initial values of trust
zeta_0 = zeros(M,M);
for i = 1 : M
    for j = 1 : M
        if i == j
            zeta_0(i,j) = 1;        %initial trust regarding themselves
        elseif MA_0(i,j) == 1
            zeta_0(i,j) = 0.1;      %initial trust regarding their neighbours
        end
    end
end

%set adaptation gain
K = 0.02;   

%set initial values of confidence (sigma) 
sigma_0 = zeros(M,M);
for i = 1 : M
    for j = 1 : M
        if i == j
            sigma_0(i,j) = 1;       
        elseif MA_0(i,j) == 1
            sigma_0(i,j) = 0.1;      
        end
    end
end

%set initial values of measurement error (delta)
delta_0 = zeros(M,M);
for i = 1 : M
    for j = 1 : M
        if i == j
            delta_0(i,j) = 1;       
        elseif MA_0(i,j) == 1
            delta_0(i,j) = 0.1;      
        end
    end
end

adapt = 1;