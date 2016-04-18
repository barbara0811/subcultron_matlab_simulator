
%number of agents
%prompt = 'What is the number of agents?';
%n = input(prompt);
n=5;
%adjacency matrix
Ao = zeros(n,n);

%flag - first time
flag = 1;
it = 0;
pr = 1;

%incijalizacija pozicija
speed=zeros(3,n+1);

Xo = zeros(1,n);
Yo = zeros(1,n);
Zo = zeros(1,n);

pos_0=zeros(3,n);

%set_param('model1/Brzina', 'Data', mat2str(speed));
set_param('model1/Integrator_brzine', 'InitialCondition', mat2str([Xo; Yo; Zo]));

%stvaranje matrice pozicije
    pos_0(1,:) = Xo;
    pos_0(2,:) = Yo;
    pos_0(3,:) = Zo;


while (flag == 1)
it = it + 1;          %number of iterations

if (n==5)
    Ao = [0 1 0 0 0 ;
         1 0 1 0 1 ; 
         0 1 0 1 1 ; 
         0 0 1 0 0 ; 
         0 1 1 0 0];
else
    
    %napraviti A iz pocetnih pozicija
    
    for i = 1 : n
        for j = 1 : n
            if (i==j)
                Ao(i,j) = 0;
            else
                Ao(i,j) = randi([0 1]);
            end
        end
    end
    Ao = double((Ao + Ao') /2 > 0);
end          


%initialization of trust values
zeta_0 = zeros(n,n);
for i = 1 : n
    for j = 1 : n
        if i == j
            zeta_0(i,j) = 1;        %initial trust regarding themselves
        elseif Ao(i,j) == 1
            zeta_0(i,j) = 0.1;      %initial trust regarding their neighbours
        end
    end
end

%adaptation gain
K = 0.02;   

%initialization of confidence value and delta value
sigma_0 = zeros(n,n);
c = zeros(n,n);

  for i=1:n 
    delta = roundn(rand(),-1);
    for j=1:n
        if Ao(j,i) == 1
            sigma_0(j,i) = roundn(rand(),-1);    
            c(j,i) = delta;
        end
    end
  end   
end

%adaptation ON/OFF
adapt = 1;

%check a spanning tree
deg = diag(sum(Ao,2));
L = deg - Ao;
row_sum = sum (L,2);

%V - full matrix whose columns are the corresponding eigenvectors
%D - diagonal matrix D of eigenvalues
[V, D] = eig(L);
D = diag(D);
D = floor(D);

number = size((find(D == 0)),1);     %number of eigenvalues = 0
if (number == 1)
    pr = round(L * V(:,find(D==0)));
end

if (row_sum == 0 & pr == 0 & number == 1) 
    flag = 0;
end 

end