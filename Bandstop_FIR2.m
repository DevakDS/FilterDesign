close all;
f_samp = 260e3;

%Band Edge speifications
fs1 = 69.8e3;
fp1 = 65.8e3;
fp2 = 93.8e3;
fs2 = 89.8e3;

Wc1 = fp1*2*pi/f_samp;
Wc2  = fp2*2*pi/f_samp;
   

[n,Wn,beta,ftype] = kaiserord([fp1 fs1 fs2 fp2],[1 0 1],[0.15 0.15 0.15],f_samp);
n=n+12;
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

kaiser_coeffs=kaiser(n+1, beta);
fvtool(hh); 



%magnitude response
[H,f] = freqz(hh,1,1024, f_samp);
figure(2)
plot(f,abs(H))
title("Magnitude Response (Linear Scale)")
xlabel("Frequency")
ylabel("|H(f)|")
grid
hold on;

figure(3)
plot(f, abs(H))
title("Sanity Check")
xlabel("Frequency")
ylabel("|H(f)|")
line([0;65800],[1.15;1.15], 'Color', 'black');
line([0;65800],[1;1], 'Color', 'black');
line([0;65800],[0.85;0.85], 'Color', 'black');
line([69800;89800],[0.15;0.15], 'Color', 'black');
line([93800;130000],[1;1], 'Color', 'black');
line([93800;130000],[0.85;0.85], 'Color', 'black');
line([93800;130000],[1.15;1.15], 'Color', 'black');

line([65800;65800],[0;1], 'Color', 'black');
line([93800;93800],[0;1], 'Color', 'black');
line([69800;69800],[0;0.15], 'Color', 'black');
line([89800;89800],[0;0.15], 'Color', 'black');
grid

hold off;