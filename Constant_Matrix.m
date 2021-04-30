%Constant Matrix

m = 80; %Mass of Washing Machine
mu = 6; %Unbalanced Mass
r = 0.25; %Radius
N = 30*pi;

constant_mat = [m; mu; r; N];
assignin('base','constant_mat',constant_mat);