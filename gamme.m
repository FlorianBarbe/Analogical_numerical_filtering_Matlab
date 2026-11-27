fe=8192;
fmin=250;
fmax=550;

function [gam,t] = GAMME(duree,fech)

% [do re mi fa sol la si doo]
freqnotes = [262 294 330 349 392 440 494 523];
t = 0:1/fech:duree;

gam = [];
for note=1:8
    gam = [gam, sin(2*pi*freqnotes(note)*t)];
end
N = length(gam);
t = (0:N-1)/fech;
end

[G,t]=GAMME(1,fe);

figure;
plot(t,G);
xlabel('Temps (s)');
ylabel('Amplitude');
grid on;

F=fft(G);
N=length(G);
freq=(0:N-1)*fe/N;

figure;
plot(freq,abs(F));
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([250 550]);       % bande demandée dans le TP
grid on;

%%application des filtres 
%% =====Filtre de Butterxorth===========
Butterworth;
%G = freqs(b,a,2*pi*freq);     % réponse fréquentielle
Bfiltre = lsim(tf(b,a),G,t);  % application au signal
FB=fft(Bfiltre);

fmlog=log10(fmin);
fmaxlog=log10(fmax);
linf=logspace(fmlog,fmaxlog,1000);
Hcont = freqs(b,a,2*pi*linf); 

figure;
subplot(1,3,1);
plot(linf,20*log10(abs(Hcont)));
xscale('log');


subplot(1,3,2)
plot(Bfiltre);


subplot(1,3,3)
plot(freq,abs(FB));
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([fmin fmax]);       % bande demandée dans le TP
grid on;

%% =====Filtre elliptique===========
Cauer;
Cfiltre = lsim(tf(b,a),G,t);  % application au signal


figure;
subplot(1,2,1)
plot(Cfiltre);

FC=fft(Cfiltre);

subplot(1,2,2)
plot(freq,abs(FC));
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([250 550]);       % bande demandée dans le TP
grid on;

%% =====Filtre de Chabyshev===========
Chabyshev;

Chab1 = lsim(tf(b1,a1),G,t);  % application au signal
Chab2 = lsim(tf(b2,a2),G,t);  % application au signal
FChab1=fft(Chab1);
FChab2=fft(Chab2);


%% Chab de type I 
figure;
subplot(1,2,1)
plot(Chab1);

subplot(1,2,2)
plot(freq,abs(FChab1));
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([250 550]);       % bande demandée dans le TP
grid on;

%% Chab de type II
figure;
subplot(1,3,1)
plot(Chab2);

Hcont = freqs(b2,a2,2*pi*linf); 

subplot(1,3,2)
plot(linf,20*log10(abs(Hcont)));
xscale('log');


subplot(1,3,3)
plot(freq,abs(FChab2));
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([250 550]);       % bande demandée dans le TP
grid on;



