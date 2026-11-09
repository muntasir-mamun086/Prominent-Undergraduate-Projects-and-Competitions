% Block Diagram Reduction of Transfer Function
clc;
clear all;
close all;
num=[1 18];
den=[2 -8 13];
g1=tf(num,den) %g1 is the First Transfer Function
pzmap (g1);
pole=pole(g1)
zero=zero(g1)
step(g1)
num1=[1 35];
den1=[2 -6 11];
g2=tf(num1,den1) %g2 is the Second Transfer Function
sys1=series(g1,g2)
sys2=parallel(g1,g2)
sys3=feedback(g1,g2,1)