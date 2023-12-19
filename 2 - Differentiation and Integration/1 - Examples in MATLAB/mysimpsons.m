function outval = mysimpsons( data, h )
    sum = 0;
    m = mod(length(data),2);
    if m == 1
        for i = 1:2:length(data)-2
            sum = sum + (data(i)+4*data(i+1)+data(i+2));
        end
        outval = 2*h*sum/6;
    else
        for i = 1:2:length(data)-3
            sum = sum + (data(i)+4*data(i+1)+data(i+2));
        end
        outval = 2*h*(sum + data(length(data)))/6;
    end
end