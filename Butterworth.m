specs;
[n,wn]=buttord(2*pi*fc,2*pi*fa,Ap,Aa, 's');
[b,a] = butter(n,wn,'s');
