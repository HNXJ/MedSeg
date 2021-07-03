function [Io, Is, Ib] = RGSegm(I)

    I = I - min(min(I));
    I = I / max(max(I));
    I = I * 255;

    regions_count = 1;

    Im1 = I;
    Im2 = I;
    Im3 = I;

    C = randi(255, [3, regions_count]);
    % for i = 1:regions_count
    %     x_i = randi(size(I, 1));
    %     y_i = randi(size(I, 2));
    %     [J, L] =  RGSegmentation(I, 10, x_i, y_i, 20000);
    % 
    %     for K = 1:size(J, 1)   
    %         Im1(J(K), L(K)) = C(1, i);
    %         Im2(J(K), L(K)) = C(2, i);
    %         Im3(J(K), L(K)) = C(3, i); 
    %     end
    % end

    x_i = 140;
    y_i = 190;
    [J, L] =  RGSegmentation(I, 15, x_i, y_i, 100000);

    for K = 1:size(J, 1)   
        Im1(J(K), L(K)) = C(1, 1);
        Im2(J(K), L(K)) = C(2, 1);
        Im3(J(K), L(K)) = C(3, 1); 
    end

    x_i = 190;
    y_i = 400;
    [J, L] =  RGSegmentation(I, 15, x_i, y_i, 100000);

    for K = 1:size(J, 1)   
        Im1(J(K), L(K)) = C(1, 1);
        Im2(J(K), L(K)) = C(2, 1);
        Im3(J(K), L(K)) = C(3, 1); 
    end

    Io = cat(3, I, I, I)/255;
    Is = zeros(size(Im1, 1), size(Im1, 2), 3);
    Is(:, :, 1) = Im1/255;
    Is(:, :, 2) = Im2/255;
    Is(:, :, 3) = Im3/255;
    Ib = Im1(:, :) == C(1, 1);

end