function solution = Dice(filename,filename2)
info=mha_read_header(filename);
firstvolume=mha_read_volume(info);
info2=mha_read_header(filename2);
secondvolume=mha_read_volume(info2);
X=reshape(firstvolume,[1,8928000]);
Y=reshape(secondvolume,[1,8928000]);
Xa=(X~=0);
Ya=(Y~=0);
solution.Whole=sum(and(Xa,Ya))*2/(sum(Xa)+sum(Ya));
Xa=(X==1)|(X==3)|(X==4);
Ya=(Y==1)|(Y==3)|(Y==4);
solution.Core=sum(and(Xa,Ya))*2/(sum(Xa)+sum(Ya));
Xa=(X==4);
Ya=(Y==4);
solution.Active=sum(and(Xa,Ya))*2/(sum(Xa)+sum(Ya));

