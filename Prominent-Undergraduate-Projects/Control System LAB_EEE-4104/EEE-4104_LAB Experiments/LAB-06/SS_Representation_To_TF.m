clc; 
clear all;
R=7.02; 
Kb=39.2*10^-3; 
B=15*10^-6; 
L=0.2; 
j=40*10^-7; 
Kt=0.02; 
A=[-R/L -Kb/L 0; Kt/j -B/j 0; 0 1 0]; 
B=[1/L; 0; 0]; 
C=[0 1 0]; 
D=0; 
[num,den]=ss2tf(A,B,C,D)
sys=tf(num,den)
[A1, B1, C1,D1]= tf2ss(num,den)