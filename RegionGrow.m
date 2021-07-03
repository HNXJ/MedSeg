function out = RegionGrow(g, q, node, vis, thresh)

n = size(g, 1);
m = size(g, 2);
i = node(1);
j = node(2);
w = node(3);

if j < m
    if vis(i, j+1) == 0
        vis(i, j+1) = 1;
        q.push([i, j+1, w + g(i, j, 1)], w + g(i, j, 1));
    end
end
if j > 1
    if vis(i, j-1) == 0
        vis(i, j-1) = 1;
        q.push([i, j-1, w + g(i, j, 3)], w + g(i, j, 3));
    end
end
if i < n
    if vis(i+1, j) == 0
        vis(i+1, j) = 1;
        q.push([i+1, j, w + g(i, j, 4)], w + g(i, j, 4));
    end
end
if i > 1
    if vis(i-1, j) == 0
        vis(i-1, j) = 1;
        q.push([i-1, j, w + g(i, j, 2)], w + g(i, j, 2));
    end
end

if q.Empty() == 0
    nNode = q.pop();
    if (nNode(3) < thresh)
        vis = RegionGrow(g, q, nNode, vis, thresh);
    end
end

out = vis;

end
