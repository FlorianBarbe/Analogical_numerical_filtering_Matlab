specs;
%% Type 1
[n1,wn1]=cheb1ord(2*pi*fc,2*pi*fa,Ap,Aa, 's');
[b1,a1] = cheby1(n1,Ap,wn,'s');

%% Type 2
[n2,wn2]=cheb2ord(2*pi*fc,2*pi*fa,Ap,Aa,'s');
[b2,a2] = cheby2(n2,Ap,wn,"low",'s');