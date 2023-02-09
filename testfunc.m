%Combination of trust-region and direct search
%Copyright: Pengcheng Xie
%xpc@lsec.cc.ac.cn

function f = testfunc(x)
    f = x(1) * x(1) + x(2) * x(2) * x(2) + exp(-x(2));
end
