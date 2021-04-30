
function  [fitness_value] = fitness_fn(design_matrix)
   run Constant_Matrix.m
   [optim_matrix ] = simRun(design_matrix);
   [row, col] = size(optim_matrix);
   assignin('base','optim_matrix',optim_matrix);
   for i =1:col
       params = optim_matrix(:,i);
       xtr_max = params(1);
       xst_max = params(2);
       ztr_max = params(3);
       zst_max = params(4);
       
       xtr_min = params(5);
       xst_min = params(6);
       ztr_min = params(7);
       zst_min = params(8);
%        
%        
%        [xtr_max, xst_max, ztr_max,  zst_max, xtr_min, xst_min, ztr_min, zst_min ] 
       fitness_value(i) = 1/(xtr_max+xst_max+ztr_max+zst_max-xtr_min-xst_min-ztr_min-zst_min);

   end
   
end