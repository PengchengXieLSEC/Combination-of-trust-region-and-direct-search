%Combination of trust-region and direct search
%Copyright: Pengcheng Xie
%xpc@lsec.cc.ac.cn

function [center, f] = itrsch(c, alpha, func, center, stragety, level)
    % init search function

global NF;
global points;
global pointsvalue;

    n = 1;
    f = func(center);
    flag = false;
    % main find loop
    while (~flag)
        % log debug info
        if (level)
            disp(['[#', int2str(n), ']:'])
            disp(['curr center: ', mat2str(center)])
            disp(['curr f value: ', num2str(f)])
            disp(['curr alpha: ', num2str(alpha)])
        end
        % search for 2N direction
        for i = 1:2 * length(center)
            center0 = center;
            % get current search direction
            [dim, val] = stragety(i, center);
            % get next point and f value
            center0(dim) = center0(dim) + val * alpha;
            f0 = func(center0);
            pointsvalue(NF)=f0;
            points(NF,:)=center0;
            NF=NF+1;

            % log debug info
            if (level)
                disp(['curr search point: ', mat2str(center0)])
                disp(['curr search point f value: ', num2str(f0)])
            end
            % find if fount
            if (f0 < f - c * alpha * alpha)
                flag = true;
                break
            end
        end
        % update
        if (flag)
            center = center0;
            f = func(center);
        else
            alpha = alpha / 2;
        end
        % increase n
        n = n + 1;
    end
    % log debug info
    if (level)
        disp(['final center: ', mat2str(center)])
        disp(['final f value: ', num2str(f)])
    end
end
