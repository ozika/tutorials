function [o] = m1(p, d)
    if strcmp(class(p), 'double')
        a =p;
        p=[];
        p.alpha = a(1);
        p.beta = a(2);
        p.s0  = a(3);
    end

    o = [];
    s = p.s0;
    o.c_ev = zeros(1,size(d.cookies_morning,1))*NaN;
    for t = 1:numel(d.cookies_morning)
        % evening amount of cookies prediction
        o.c_ev(t) = d.cookies_morning(t) - (1 - s(t))*p.alpha*d.h;
        
        % cookies eaten every day
        d.delta_c(t) = d.cookies_morning(t) - o.c_ev(t);
        
        % update satiety
        s(t+1) = s(t) + p.beta*((d.delta_c(t)/30) - s(t));
    end
    %remove last prediction 
    s(length(s)) =[];
    o.s = s;
    
    
end

