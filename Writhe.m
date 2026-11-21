function w = writhe(L)
    n = size(L,2);
    w = zeros(n,1);
    for i =1:n
        w(i) = cross(L(:,i));
    end
    w = sum(w);
end



function val = cross(x)

    [a,b,a2,b2] = deal(x(1),x(2),x(3),x(4)); %Takes the components of the crossing

    % Checks if the opposite sides are next to each other (if not it's the
    % end of the cycle so the orientation will go in the opposite
    % direction)
    if abs(a2-a) ~= 1
        [a, a2] = deal(a2,a);
    end
    if abs(b2-b) ~= 1
        [b, b2] = deal(b2,b);
    end
    

    % Logical statement which output 1 if the statement is true
    A = (a2>a);
    B = (b2>b);
    
    % Assigns value depending on the two cases
    if A+B == 1
        val = 1;
    else
        val = -1;
    end
end

hopf = [2,3;4,1;1,4;3,2]; % writhe of -2
whitehead = [1,3,5,7,9;10,9,2,5,6;2,4,6,8,10;7,8,3,4,1]; % writhe of -1


writhe(hopf)