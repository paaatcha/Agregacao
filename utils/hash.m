function vHash = hash (val)
    n = size(val,2);
    
    p = prod (val)*n + (sum(n) - n) + val(1);

    vHash = p;
end

