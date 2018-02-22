function h = entropy(vec)    
    logs = log2(vec);
    
    % replacing the -inf to zero, just in case the vector has elements
    % equal to zero
    logs(~isfinite(logs))= 0;
    
    % Computing the entropy
    h = -sum(logs.*vec);
    
    
    % TIRAR DEPOIS
    %hmax = -log2((1/length(vec)));
    %h = hmax - h;
    
    %h = -log2(max(vec));
        
end

