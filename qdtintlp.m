%Combination of trust-region and direct search
%Copyright: Pengcheng Xie
%xpc@lsec.cc.ac.cn

function [hess, grad, c] = qdtintlp(xs, fs)
    A = [
         xs(1, 1) * xs(1, 1) / 2, xs(1, 2) * xs(1, 2) / 2, xs(1, 1) * xs(1, 2), xs(1, 1), xs(1, 2), 1;
         xs(2, 1) * xs(2, 1) / 2, xs(2, 2) * xs(2, 2) / 2, xs(2, 1) * xs(2, 2), xs(2, 1), xs(2, 2), 1;
         xs(3, 1) * xs(3, 1) / 2, xs(3, 2) * xs(3, 2) / 2, xs(3, 1) * xs(3, 2), xs(3, 1), xs(3, 2), 1;
         xs(4, 1) * xs(4, 1) / 2, xs(4, 2) * xs(4, 2) / 2, xs(4, 1) * xs(4, 2), xs(4, 1), xs(4, 2), 1;
         xs(5, 1) * xs(5, 1) / 2, xs(5, 2) * xs(5, 2) / 2, xs(5, 1) * xs(5, 2), xs(5, 1), xs(5, 2), 1;
         xs(6, 1) * xs(6, 1) / 2, xs(6, 2) * xs(6, 2) / 2, xs(6, 1) * xs(6, 2), xs(6, 1), xs(6, 2), 1;
         ];
    coefs = A \ fs;
    hess = [coefs(1), coefs(3); coefs(3), coefs(2)];
    grad = [coefs(4); coefs(5)];
    c = coefs(6);
    % for idx = 1:length(xs)
    %     disp([num2str(idx), ' is ', num2str(0.5 * xs(idx, :) * hess * xs(idx, :)' + xs(idx, :) * grad + c - fs(idx))]);
    % end
end
