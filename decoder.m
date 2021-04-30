function [design_matrix] = decoder(population)

    design_matrix = zeros(20,6);
    for i=1:20
        count=1;
        for j=1:3:18
        
            design_matrix(i,count) = bin2dec(num2str(population.Chromosomes(i).Gene([j : j+2])));
            count = count+1;
        end
    end
    
    design_matrix(:,1) = 5000 + design_matrix(:,1)*357.15;
    design_matrix(:,2) = 150 + design_matrix(:,2)*35.715;
    design_matrix(:,3) = 0.03 + design_matrix(:,3)*0.0143;
    design_matrix(:,4) = 0.09 + design_matrix(:,4)*0.0204;
    design_matrix(:,5) = 0.03 + design_matrix(:,5)*0.0143;
    design_matrix(:,6) = 0.1 + design_matrix(:,6)*0.01528;
  

end