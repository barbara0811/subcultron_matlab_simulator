clear all;
clc;

%number of agents
prompt = 'What is the number of agents?';
n = input(prompt);

%adjacency matrix
A = zeros(n,n);

%flag - first time
flag = 1;
it = 0;
pr = 1;

while (flag == 1)
it = it + 1;          %number of iterations

if (n==5)
    A = [0 1 0 0 0 ;
         1 0 1 0 1 ; 
         0 1 0 1 1 ; 
         0 0 1 0 0 ; 
         0 1 1 0 0];
else
    for i = 1 : n
        for j = 1 : n
            if (i==j)
                A(i,j) = 0;
            else
                A(i,j) = randi([0 1]);
            end
        end
    end
    A = double((A + A') /2 > 0);
end
            

%initialization of trust values
zeta_0 = zeros(n,n);
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

if (n==5) 
    sigma_0 = [ 0    0.7   0    0    0       
                1     0    1    0    1
                0    0.5   0   1.4   1
                0     0    1    0    0 
                0    0.4   1    0    0];
            
    c = [ 0   0.2   0   0   0 ; 
         0.8   0   0.4  0   1 ;
          0   0.2   0  0.6  1 ;
          0    0   0.4  0   0 ;
          0   0.2  0.4  0   0 ];
else
  for i=1:n 
    delta = roundn(rand(),-1);
    for j=1:n
        if A(j,i) == 1
            sigma_0(j,i) = roundn(rand(),-1);    
            c(j,i) = delta;
        end
    end
  end   
end

%adaptation ON/OFF
adapt = 1;

%check a spanning tree
deg = diag(sum(A,2));
L = deg - A;
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