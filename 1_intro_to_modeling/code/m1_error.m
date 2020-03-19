function [e] = m1_error(p, d)

    % evaluate
    [o] = m1(p,d);
    
    
    
    %  error
    for i = 1:numel(d.cookies_evening)
        L(i) = (normpdf(d.cookies_evening(i), o.pred_cookies_evening(i), 2)); %assumption 
    end
    e=(-1)*log(sum(L));
    
    
end

