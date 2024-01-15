function outvar = mytrapz( data, h )
    sumQ = 0;
    for i = 1:length(data)-1
        sumQ = sumQ + (data(i) + data(i+1))/2;
    end
    outvar = h*sumQ;
end