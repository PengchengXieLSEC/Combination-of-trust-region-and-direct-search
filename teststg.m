%Combination of trust-region and direct search
%Copyright: Pengcheng Xie
%xpc@lsec.cc.ac.cn

function [dim, val] = teststg(idx, x, pre)
    deltax = x - pre;
    if (idx > length(x))
        idx = idx - length(x);
        [~, sqc] = sort(abs(deltax));
        dim = sqc(idx);
        val =- sign(deltax(dim));
    else
        [~, sqc] = sort(abs(deltax), 'descend');
        dim = sqc(idx);
        val = sign(deltax(dim));
    end
end
