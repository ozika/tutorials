function [e] = m2_error(p, d)

    % evaluate
    [o] = m2(p,d);
    
    
    %  error
    for i = 1:numel(d.cookies_evening)
        L(i) = (normpdf(d.cookies_evening(i), o.c_ev(i), 2)); %assumption 
    end
    e=(-1)*log(sum(L));
    if e == Inf
        e = 9999;
    end
        
    
end

