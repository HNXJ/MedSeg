function J = RegionGrowingSegmentate(I, thresh)

    J = zeros(size(I));
    J(1, :) = 1;
    J(:, 1) = 1;
    J(end, :) = 1;
    J(:, end) = 1;
    
    cnt = 0;
    for i = 2:size(I, 1)-1
        for j = 2:size(I, 2)-1
           if J(i, j) == 0
               cnt = cnt + 1;
               qlist = [];
               qlistcnt = 1;
               
               newcolor = cnt*5;
               J(i, j) = newcolor;
               
               if abs(I(i, j) - I(i, j-1)) < thresh && J(i, j-1) == 0
                   cat(1, qlist, [i, j-1]);
               end
               if abs(I(i, j) - I(i, j+1)) < thresh && J(i, j+1) == 0
                   cat(1, qlist, [i, j+1]);
               end
               if abs(I(i, j) - I(i-1, j)) < thresh && J(i-1, j) == 0
                   cat(1, qlist, [i-1, j]);
               end
               if abs(I(i, j) - I(i+1, j)) < thresh && J(i+1, j) == 0
                   cat(1, qlist, [i+1, j]);
               end
               
               while qlistcnt <= size(qlist, 1)
                   x = qlist(qlistcnt, 1);
                   y = qlist(qlistcnt, 2);
                   J(x, y) = newcolor;
               
                   if abs(I(x, y) - I(x, y-1)) < thresh && J(x, y-1) == 0
                       cat(1, qlist, [x, y-1]);
                   end
                   if abs(I(x, y) - I(x, y+1)) < thresh && J(x, y+1) == 0
                       cat(1, qlist, [x, y+1]);
                   end
                   if abs(I(x, y) - I(x-1, y)) < thresh && J(x-1, y) == 0
                       cat(1, qlist, [i-1, j]);
                   end
                   if abs(I(x, y) - I(x+1, y)) < thresh && J(x+1, y) == 0
                       cat(1, qlist, [x+1, y]);
                   end
                   qlistcnt = qlistcnt + 1;
               end
           end
        end
    end

end

