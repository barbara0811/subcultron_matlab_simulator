n=5;
%adjacency matrix
A_0 = zeros(n,n);

wanted = 0;
wanted = [0.1564 0.9877];

pr = 1;

%incijalizacija pozicija
speed=zeros(3,n);

r_0=1;
X_0 = zeros(1,n);
Y_0 = zeros(1,n);
Z_0 = zeros(1,n);

pos_0=zeros(3,n);

%set_param('model1/Brzina', 'Data', mat2str(speed));
%set_param('model1/Integrator_brzine', 'InitialCondition', mat2str([Xo; Yo; Zo]));

%stvaranje matrice pozicije
    pos_0=[0 0 0 0 1; 
           4 3 2 1 2.5 ;
           0 0 0 0 0 ];

%napraviti A iz pocetnih pozicija
    for i = 1:n
        for j = 1:n
        %odredivanje udaljenosti izmedju musula - prvo x, y, pa z
        distance_0 = sqrt((pos_0(1,i)-pos_0(1,j))^2 + (pos_0(2,i)-pos_0(2,j))^2+(pos_0(3,i)-pos_0(3,j))^2);
        
        %provjera mogu li komunicirati
        if distance_0 < r_0
            
                %element ne komunicira sam sa sobom
                if i == j
                    A_0(i,j) = 0;
                else
                    A_0(i,j) = 1;
                end
                        
        else
                A_0(i,j) = 0;
        
        end
        end
    end
    
%initialization of trust values
zeta_0 = zeros(n,n);
for i = 1 : n
    for j = 1 : n
        if i == j
            zeta_0(i,j) = 1;        %initial trust regarding themselves
        elseif A_0(i,j) == 1
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
    sigma_0 = [ 0    0.7   0.4    0.6    0.5       
                1     0    1    0.8    1
                0.8    0.5   0   1.4   1
                0.9     0.2    1    0    0.4 
                0.3    0.4   1    0.2    0];
            
    c = [ 0   0.2   0.7   0.8   0.9 ; 
         0.8   0   0.4  0.3   1 ;
          0.7   0.2   0  0.6  1 ;
          0.9    0.7   0.4  0   0.4 ;
          0.1   0.2  0.4  0.3   0 ];
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
deg = diag(sum(A_0,2));
L = deg - A_0;
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

%%PLOTANJE POZICIJA AGENATA
scatter(pos_0(1,:), pos_0(2,:), 'filled', 'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',4)
xlim([0 4])
ylim([0 4])
ylabel('Y-koordinata pozicija agenata')
xlabel('X-koordinata pozicija agenata')
grid on


