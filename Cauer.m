specs;
[n,wn]=ellipord(2*pi*fc,2*pi*fa,Ap,Aa, 's');
[b,a] = ellip(n,Ap,Aa,wn,'s');
