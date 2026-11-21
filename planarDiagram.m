% faster way to input planar diagrams

function pd = planarDiagram
n = input('How many crossings are there?');
pd = zeros(4,n);
for i = 1:n
    x = input(sprintf('What is crossing %f', fix(i)));
    pd(:,i) = x;
end
end