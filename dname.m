function s = dname(x)
    
    s = 'CT000000';
    k = 8;
    while x > 0
       s(k) = num2str(mod(x, 10)); 
       x = floor(x / 10);
       k = k - 1;
    end
    
end

