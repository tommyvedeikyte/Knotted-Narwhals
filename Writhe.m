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
    % end of the cycle so the orientation will swap
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
solomon = [6 8 2 4;1 3 5 7;7 5 3 1;2 4 6 8];
whitehead = [1,3,5,7,9;10,9,2,5,6;2,4,6,8,10;7,8,3,4,1]; % writhe of -1
trefoil = [2 4 6;5 1 3;3 5 1;6 2 4]; % writhe of -3
figure8 = [4 8 6 2;2 6 3 7;5 1 7 3;1 5 4 8]; % writhe of 0

%Uses the functions to find the link number
function l = linknum(L)
crossings = linkcrossings(L);
l = writhe(crossings);
end

function crossings = linkcrossings(L)
n = size(L,2);

% creates empty matrices for the component labels and link crossings
component = zeros(2,0);
crossings = zeros(4,0);

% loops through the crossings and finds the ends of different components
% by looking for gaps larger than 1. These labels are then added stored so
% that we know which labels each link component has
for i = 1:n
    [a,b,a2,b2] = deal(L(1,i),L(2,i),L(3,i),L(4,i));
    if abs(a2-a) ~= 1
        component = [component, sort([a;a2])];
    end
    if abs(b2-b) ~= 1
        component = [component, sort([b;b2])];
    end
end


% Goes through each crossing again and checks whether the labels for both
% parts of the crossing are in the same component. If so the crossing is of
% a component with itself and is not added to the link crossing matrix.
for i = 1:n
    [a,b,a2,b2] = deal(L(1,i),L(2,i),L(3,i),L(4,i));
    linkcross = 1;
    for j = 1:size(component,2)
        A = isbetween(a,component(1,j),component(2,j));
        B = isbetween(b,component(1,j),component(2,j));
        if A&&B
            linkcross = 0;
        end
    end
    if linkcross == 1
        crossings = [crossings,[a;b;a2;b2]];
    end
end
end


l = linkcrossings([6 10 2 4 11 9;1 3 5 7 8 12;7 5 3 1 12 10;2 4 6 8 9 11])
linkcrossings(solomon)