% Determination of Poles, Zeroes and Stability Check of Transfer Function
clc;
clear all;
close all;
num=[1 18];
den=[2 -8 13];
g1=tf(num,den) %g1 is the Transfer Function
pzmap (g1);
pole=pole(g1)
zero=zero(g1)
step(g1)

