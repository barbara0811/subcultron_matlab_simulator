for i=5*Td+1:10:size(x.Data,1)
    if ((max(std(x.Data(i-5*Td:i,:),0,1)) < 0.1) && (max(std(x.Data(i-5*Td:i,:),0,2)) < 0.1))
        conv_time = x.Time(i)
        return
    end
end

conv_time = -1