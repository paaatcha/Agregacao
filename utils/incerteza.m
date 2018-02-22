function inc = incerteza(vec)    
    logs = log2(vec);
    
    % replacing the -inf to zero, just in case the vector has elements
    % equal to zero
    logs(~isfinite(logs))= -10;
    
    % Computing the uncetainty
    inc = -sum(logs);       
end
