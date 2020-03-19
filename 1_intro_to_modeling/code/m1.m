function [o] = m1(p, d)
    if strcmp(class(p), 'double')
        a =p;
        p=[];
        p.lambda_ch = a(1);
        p.lambda_noch = a(2);
    end
    
    ch0 = find(d.ch_present == 0);
    ch1 = find(d.ch_present == 1);
    o = [];
    o.pred_cookies_evening = zeros(1,size(d.cookies_morning,1))*NaN;

    o.pred_cookies_evening(ch1) = d.cookies_morning(ch1) - (p.lambda_ch * d.h); 
    o.pred_cookies_evening(ch0) = d.cookies_morning(ch0) - (p.lambda_noch * d.h); 
    o.pred_cookies_evening(find(o.pred_cookies_evening<0)) = 0;
    
end

