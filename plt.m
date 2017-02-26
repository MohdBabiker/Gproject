function write = plt(filename)
info=mha_read_header(filename);
volume=mha_read_volume(info);
solutionvector=reshape(volume,[1,8928000]);
offset = zeros(1,8928000);
for n = 1:8928000 
    offset(n) = solutionvector(n); 
end
solutionvector=reshape(offset,[240,240,155]);
pcolor(solutionvector(:,:,69));
shading interp;
colorbar;


