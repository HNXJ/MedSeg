function [xx, yy] = RGSegmentation(I, thresh, x_i, y_i, thresh_size)

    Y = zeros(size(I));
    center = I(x_i, y_i);
    counts = 1;
    adjs = 0;
    
    stack = zeros(thresh_size,3); 
    dist = 0;
    k = [-1, 0;1, 0;0, -1;0, 1];
    
    while dist < thresh && counts < numel(I) && counts < thresh_size
    
        for j = 1:4
            xn = x_i + k(j,1); 
            yn = y_i + k(j,2);
            if (xn >= 1) && (yn >= 1) && (xn <= size(I,1)) && (yn <= size(I,2)) && (Y(xn, yn) == 0) 
                    adjs = adjs + 1;
                    stack(adjs,:) = [xn yn I(xn,yn)]; Y(xn,yn)=1;
            end
        end
        
        dist = abs(stack(1:adjs, 3) - center);
        [dist, pos] = min(dist);
        counts = counts + 1;
        Y(x_i, y_i) = 2; 
        
        center = (center*counts + stack(pos, 3))/(counts + 1);
        x_i = stack(pos, 1); 
        y_i = stack(pos, 2);
        stack(pos,:) = stack(adjs,:);
        adjs = adjs - 1;
    end
    
    Y = Y > 1;
    [xx, yy] = find(Y == 1);
    
end