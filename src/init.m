clearvars -except filename;
clc;

try
   xDoc = xmlread(filename);
catch
   error('Failed to read XML file %s.',filename);
end

n = str2num(char(xDoc.getElementsByTagName('mussel_num').item(0).getFirstChild.getData));

positions = zeros(n,2);
positions_filename = char(xDoc.getElementsByTagName('positions').item(0).getFirstChild.getData);
fileID = fopen(positions_filename,'r');
pos_tmp = fscanf(fileID,'%f %f');

for i = 1:n
    positions(i,:) = pos_tmp(2*(i-1) + 1 : 2*(i-1) + 2);
end

% other params
try
    %acoustic comm
    Tw=0;Td=0;
    comm_type_string = char(xDoc.getElementsByTagName('comm_type').item(0).getFirstChild.getData);
    comm_range = str2num(xDoc.getElementsByTagName('comm_range').item(0).getFirstChild.getData);
    
    try
        Td = str2num(xDoc.getElementsByTagName('Td').item(0).getFirstChild.getData);
        Tw = str2num(xDoc.getElementsByTagName('Tw').item(0).getFirstChild.getData);
    catch
        disp('no comm periods specified');
        Td = 0;
        Tw = 0;
    end
            
    switch comm_type_string
        case 'ideal'
            comm_type = 3;
        case 'scheduled'
            comm_type = 2;
        case 'random'
            comm_type = 1;
    end
catch
    disp('error with comm specification');
end

%initialization of trust values
zeta_0 = zeros(n,n);
% init adjacency matrix
A=zeros(n);

for i = 1:n
    for j = 1:n
        distance = sqrt((positions(i,1)-positions(j,1))^2 + ...
                        (positions(i,2)-positions(j,2))^2);
        
        if distance <= comm_range
            if i == j
                A(i,j) = 0;
            else
                A(i,j) = 1;
            end
        else
            A(i,j) = 0;
        end
    end
end

for i = 1 : n
    for j = 1 : n
        if i == j
            zeta_0(i,j) = 1;        %initial trust regarding themselves
        elseif A(i,j) == 1
            zeta_0(i,j) = 0.1;      %initial trust regarding their neighbours
        end
    end
end

%adaptation gain
K = 0.02;   

%initialization of confidence value and delta value
sigma_0 = zeros(n,n);
c = zeros(n,n);


%adaptation ON/OFF
adapt = 1;
