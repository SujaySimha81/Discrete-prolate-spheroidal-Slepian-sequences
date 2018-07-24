function [hf,f]=iirnotch(f0,fs,r)
b0=1;
b1=-2*cos(2*3.14*f0/fs);
b2=1;
a0=1;
a1=-2*r*cos(2*3.14*f0/fs)
a2=r*r;
b=[b2,b1,b0];
a=[a2,a1,a0];
[h1,f1]=frmag(b,a,fs);
hf=20*log10(abs(h1));
f=f1*fs;
endfunction
