function mat = makeProb(mat)
    [m,n] = size(mat);
    
    for j=1:n
        mat(:,j) = mat(:,j)/sum(mat(:,j));
    end
    
end

