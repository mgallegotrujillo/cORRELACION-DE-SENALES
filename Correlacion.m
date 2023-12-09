clear all 
clc

%An�lisis de correlaci�n de se�ales
n=0:99;
% Generando se�ales de prueba

xn=xn = 2 + 3*cos(2*pi*n/25)+2* sen((2*pi*n/20) +2*sen(2*pi*n/15)

snr=5
xn=awgn(xn, snr);

%%%%%%%%%%%%%%%%%%%%%%%%%%55

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% xk=fft;
figure('Name','se�ales x(n) y y(n)')

stem(n,xn)   
hold on
yn(w,:)=awgn(yn(w,:), snr);
stem(n,xn)
for w=1:3


end
legend('x(x)','y1(x)','y2(x)','y3(x)')


xk=fft(xn);
figure('Name','Graficos Caracteristicos x(n)');
subplot(4,1,1);
stem(n,abs(xk),'c');
title('Espectro de magnitud');

espreal=real(xk);
espimg=imag(xk);
magnitud=abs(xk);
fase=angle(xk);

%fase
subplot(4,1,2);
stem(n,fase,'g');
title('Espectro de fase');

%Parte real
subplot(4,1,3);
stem(n,espreal,'G');
title('Parte real');

%Parte imaginaria
subplot(4,1,4);
stem(n,espimg,'R');
title('Parte imaginaria');

for w=1:4


xk=fft(yn(w,:));
figure('Name',['Graficos Caracteristicos ','y',num2str(w),'(n)']);
subplot(4,1,1);
stem(n,abs(xk),'c');
title('Espectro de magnitud');

espreal=real(xk);
espimg=imag(xk);
magnitud=abs(xk);
fase=angle(xk);

%fase
subplot(4,1,2);
stem(n,fase,'g');
title('Espectro de fase');

%Parte real
subplot(4,1,3);
stem(n,espreal,'G');
title('Parte real');

%Parte imaginaria
subplot(4,1,4);
stem(n,espimg,'R');
title('Parte imaginaria');
    
    
    
% C�lculos de correlaci�n cruzada y coeficiente de correlaci�n
[xc,lag]=xcorr(xn,yn(w,:));
figure('Name',['Correlaci�n cruzada ','x(n) y y',num2str(w),'(n)'])
stem(lag,xc)
ca=corr(xn',yn(w,:)')
title(['Ca',num2str(w),'=',num2str(ca)])
end

peaksnr
snr