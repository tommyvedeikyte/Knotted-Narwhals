function w = writhe(L)
    n = size(L,2);
    w = zeros(n,1);
    for i =1:n
        w(i) = cross(L(:,i),n);
    end
    w = sum(w);
end



function val = cross(x,n)

    [a,b,a2,b2] = deal(x(1),x(2),x(3),x(4));
    if (a == 1 && a2 == 2*n) || (a==2*n && a2 ==1)
        a = mod(a,2*n);
        a2 = mod(a2,2*n);
    end
    if ( b== 1 && b2 == 2*n) || (b==2*n && a2 ==1)
        b = mod(b,2*n);
        b2 = mod(b2,2*n);
    end

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