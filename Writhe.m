function w = writhe(L)
    n = size(L,2);
    w = zeros(n,1);
    for i =1:n
        w(i) = cross(L(:,i));
    end
    w = sum(w);
end



function val = cross(x)
    [a,b,a2,b2] = deal(x(1),x(2),x(3),x(4));
    if a2 > a
        if b2 > b
            val = -1;
        else
            val = 1;
        end
    else
        if b2 > b
            val = 1;
        else
            val = -1;
        end
    end
end


L = [3,5,1;6,2,4;2,4,6;2,4,6];

writhe(L)