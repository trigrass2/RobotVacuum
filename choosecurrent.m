%% Chooses new current from openset based on the location in openset with the lowest f value
function current=choosecurrent(openset,F)
for k=1:length(openset)
    fo(k)=F(openset(k,1),openset(k,2)); %#ok<AGROW>
    [~,i]=min(fo);
    current=openset(i,:);
end