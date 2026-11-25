function pd = br2pd(B)
% setup
n = size(B,2);
% Our pd representation
pd = zeros(4,n);
% starting strand
strand = 1;
% The strands we have started on
strandsStarted = [];
% Label for the pd
label = 1;
% The different components of the link
linkComps = [1;0];

% Stops iterating once all crossings have been filled
while label <= 2*n
    strandsStarted = [strandsStarted, strand];

    % Loops round the braid name
    for i = 1:n

        % Checks if the braid number affects the strand we are on
        if (strand == abs(B(i)))

            % Checks the sign of the crossing
            if B(i) > 0

                %Uses the replace function to add to the pd
                [pd(2,i), ~, fin] = replace(label+1, pd(2,i));
                [pd(4,i), label, fin] = replace(label, pd(4,i));

                % fin checks to see if we've already labeled the pd
                % and if so stops the for loop so we can begin a new
                % component
                if fin
                    break
                end
                % Changes the strand number depending on the crossing
                strand = strand + 1;

            else
                [pd(3,i), ~, fin] = replace(label+1, pd(3,i));
                [pd(1,i), label,fin] = replace(label, pd(1,i));
                if fin
                    break
                end
                strand = strand + 1;
            end

        elseif (strand == abs(B(i))+1)

            if B(i) > 0
                [pd(3,i), ~, fin] = replace(label + 1, pd(3,i));
                [pd(1,i), label, fin] = replace(label, pd(1,i));
                if fin
                    break
                end
                strand = strand - 1;

            else
                [pd(4,i), ~, fin] = replace(label + 1, pd(4,i));
                [pd(2,i), label, fin] = replace(label, pd(2,i));
                if fin
                    break
                end
                strand = strand - 1;
            end

        end

    end

    % Checks to see if we are moving to a new link component
    if fin
        fin = 0;
        orig = strand;

        % Adds to the end label to the link component matrix
        linkComps(2,end) = label;
        % Swaps all values in pd with the current label to the first label
        % in our link component
        id = (pd == label);
        pd(id) = linkComps(1,end);
        linkComps = [linkComps,[label;0]];

        % Goes through the possible strands of the braid and chooses one we
        % haven't started on
        for j = 1:max(abs(B)+1)
            if ismember(strandsStarted,j) == 0
                strand = j;
                break
            end
        end
    end
end

%Swaps our last label in the pd since it is missed off
id = (pd == label);
pd(id) = linkComps(1,end);

end


function [pd, label,fin] = replace(label, pd)
fin = 0;

% Checks to see if the crossing has already been labeled. If it has fin is
% updated. Otherwise the function changes the crossing label.
if pd == 0
    pd = label;
    label = label + 1;
else
    fin = 1;
end
end

pd = br2pd([-1,2,-1,2,-1])