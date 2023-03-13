clc; clear; close all;
w = linspace(0.5,10,1000);

TSA = 60*w.*w + 800./w;
TSAd = 120*w - 800./(w.*w);
TSAdd = 120 + 1600./(w.*w.*w);

plot(w,TSA);
hold on
plot(w, TSAd);
hold on
plot(w, TSAdd);
