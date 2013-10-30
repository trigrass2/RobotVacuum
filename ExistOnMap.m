function state = ExistOnMap(map,searchTerms)
%ExistOnMap loads a map matrix and returns whether value(s) was found
%Input args
%  map = two dimensional map to be searched
%  searchTerms = single dimensional array of value(s) to be searched
%Output args
%  state = boolean, 0 for not found, 1 for found

[m,n] = size(map);

for y = 1:m
        for x = 1:n
             for s = 1 : length(searchTerms)
                if map(y,x) == searchTerms(s)
                    state = 1;
                    return 
                end
             end
        end
end

state = 0;

