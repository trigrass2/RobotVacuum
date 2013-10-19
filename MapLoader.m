function matrix = MapLoader(filename)
%MapLoader loads a text file, reads the contents, and returns a matrix
%Input args
%  filename = filename of the text file containing the map
%Output args
%  matrix = resulting matrix


fid=fopen(filename,'r');
if fid==-1
    fprintf(2,'File %s not found\n',filename)
    return
end

getLine = fgetl(fid);
fseek(fid, 0, 'bof');
getLine = sscanf(getLine,'%d');

lineLength = length(getLine);

matrix=fscanf(fid,'%d', [lineLength, inf])';

fclose(fid);

