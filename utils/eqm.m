% Fun��o que calcula o erro quadr�tico m�dio

function erro = eqm(yRede,yReal)

[n N] = size (yRede);
erro = sum((yReal-yRede).^2)/N;

end

