% Am: matrice aumentata Am = [A b].
% indice_pivot: indice del pivot che si sta considerando

function Am = CercaPivot(Am, indice_pivot)
  n = length(Am);
  if Am(indice_pivot,indice_pivot) ~= 0
    return
  else
    for i=indice_pivot+1:n
      if Am(i,indice_pivot) ~= 0
        fprintf('Scambio riga %i con riga %i\n', i, indice_pivot);
        alias = Am(i,:);
        Am(i,:) = Am(indice_pivot,:);
        Am(indice_pivot,:) = alias;
        Am
        return
      end
    end
  end
end