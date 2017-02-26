function generateNullMhaImageFile()
solutionvector= zeros(1,8928000);
volume=reshape(solutionvector,[240,240,155]);
writemetaimagefile('null.mha',volume,[240 240 155],[0 0 0])