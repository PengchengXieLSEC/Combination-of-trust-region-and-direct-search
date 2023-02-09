%Combination of trust-region and direct search
%Copyright: Pengcheng Xie
%xpc@lsec.cc.ac.cn

global pointsvalue;
global points;
global NF;
NF=1;

pointsvalue=zeros(96,1);
points=zeros(96,2);

x0s = [1, 0; 4, 0; 1, 3; -2, 0; 1, -3; 0, -1];
%x0s = [2, 0; 5, 0; 2, 3; -1, 0; 2, -3; 1, -1];
%x0s = [12, -5; 15, -5; 12, -2; 9, -5; 12, -8; 11, -6];
%x0s = [1, 0; 1, 4; 1, 3; 1, -3; 1, -4; 1, -0.1];
%x0s = [1, 0; 1.1, 4.2; 1, 3; 1.1, -3.2; 1.2, -4.1; 1.1, -0.1];
%x0s = [1, 0; 2, 0; 1, 1; 0, 0; 1, -1; 0, -1/2];
delta = 1;
c = 0.25;
func = @(x)(testfunc(x));
criter = @(n, ~)(testctr(n, 5));
search(x0s, c, delta, func, criter, true)
pointsvalue
points
NF
