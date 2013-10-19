function matrix = MapLoader(filename)
%MapLoader loads a text file, reads the contents, and returns a matrix
%Input args
%  filename = filename of the text file containing the map
%Output args
%  matrix = resulting matrix


%Probably should have some switch logic right here 
%so that the function can read both txt and xls files


%checks for valid file input
fid=fopen(filename,'r');
if fid==-1
    fprintf(2,'File %s not found\n',filename)
    return
end

%gets line length in order to work with any matrix size
%has to read the first line, so most of this is just to
%reset it back to the top line
getLine = fgetl(fid);
fseek(fid, 0, 'bof');
getLine = sscanf(getLine,'%d');
lineLength = length(getLine);

%passes the actual file into be read for its entire length
%empty spaces are read as '0'
matrix=fscanf(fid,'%d', [lineLength, inf])';

fclose(fid);

