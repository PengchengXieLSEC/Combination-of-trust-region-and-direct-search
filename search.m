%Combination of trust-region and direct search
%Copyright: Pengcheng Xie
%xpc@lsec.cc.ac.cn

function search(x0s, c, delta0, func, criter, level)
    n = 1;
    fmin = Inf;
    while criter(n, fmin)
        if (level)
            disp(['[#switch]:', int2str(n)])
        end
        % switch search policy
        if (level)
            disp('[itp step]:')
        end
        [x0s, jdx, delta, pre] = itpsch(x0s, delta0, func, level);
        if (level)
            disp('[sch step]:')
        end
        stg = @(idx, x)(teststg(idx, x, pre));
        [xnew, fmin] = itrsch(c, delta, func, x0s(jdx, :), stg, level);
        % update xs
        fs = zeros(length(x0s), 1);
        for idx = 1:length(x0s)
            fs(idx) = func(x0s(idx, :));
        end
        [~, kdx] = max(fs);
        x0s(kdx, :) = xnew;
        % increase n
        n = n + 1;
    end
end
