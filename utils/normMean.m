function d = normMean(d)
    d = (d - mean(mean(d)))/std(std(d));
end

