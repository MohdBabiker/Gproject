function write = split(filename,plane,slices,outfolder)
info=mha_read_header(filename);
volume=mha_read_volume(info);
solutionvector=reshape(volume,[1,8928000]);
offset = zeros(1,8928000);
for n = 1:8928000 
    offset(n) = solutionvector(n); 
    offset(n) = offset(n)/1300;
end

solutionvector=reshape(offset,[240,240,155]);
switch(plane)
    case 'axial'
        for i = 1:numel(slices)
        imwrite(solutionvector(:,:,slices(i)),strcat(strcat(outfolder,'\'),strcat(int2str(slices(i)),'.jpg')));
        end
    case 'sagittal'
        for i = 1:numel(slices)
        Y=squeeze(solutionvector(slices(i),:,:));
        imwrite(Y,strcat(strcat(outfolder,'\'),strcat(int2str(slices(i)),'.jpg')));
        end
    case 'coronal'
        for i = 1:numel(slices)
        Y=squeeze(solutionvector(:,slices(i),:));
        imwrite(Y,strcat(strcat(outfolder,'\'),strcat(int2str(slices(i)),'.jpg')));
        end
end
write=solutionvector(:,:,69);
