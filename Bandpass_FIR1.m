close all;
f_samp = 330e3;

%Band Edge speifications
fs1 = 85.4e3;
fp1 = 89.4e3;
fp2 = 109.4e3;
fs2 = 113.4e3;

Wc1 = fp1*2*pi/f_samp;
Wc2  = fp2*2*pi/f_samp;
   

[n,Wn,beta,ftype] = kaiserord([fs1 fp1 fp2 fs2],[0 1 0],[0.15 0.15 0.15],f_samp);
n=n+16;
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

kaiser_coeffs=kaiser(n+1, beta);
fvtool(hh); 



%magnitude response
[H,f] = freqz(hh,1,1024, f_samp);
figure(2);
plot(f,abs(H));
title("Magnitude Response (Linear Scale)");
xlabel("Frequency");
ylabel("|H(f)|");
grid;
hold on;
figure(3)
plot(f, abs(H))
title("Sanity Check")
xlabel("Frequency")
ylabel("|H(f)|")
line([89400;109400],[1.15;1.15], 'Color', 'black');
line([89400;109400],[1;1], 'Color', 'black');
line([89400;109400],[0.85;0.85], 'Color', 'black');
line([113400;165000],[0.15;0.15], 'Color', 'black');
line([0;85400],[0.15;0.15], 'Color', 'black');

line([89400;89400],[0;1.15], 'Color', 'black');
line([109400;109400],[0;1.15], 'Color', 'black');
line([113400;113400],[0;0.15], 'Color', 'black');
line([85400;85400],[0;0.15], 'Color', 'black');
grid

hold off;