curr_muss= [0 0; 0 0; 0 0; 0 0; 0 0];
delta=zeros(5);
error=0;

curr = [2 3];

k = [1 1; 1 1; 1 1; 1 1; 0.8 0.8];
curr_ag = [curr; curr; curr; curr; curr];
curr_muss = k.*curr_ag;

for i =1:5
    for j=1:5
        
        error = abs(sqrt(curr_muss(i,1)^2+curr_muss(i,2)^2)-sqrt(curr_muss(j,1)^2+curr_muss(j,2)^2))
        delta(i,j)=error
        
    end
end
        