function [child1 , child2] = crossover(parent1 , parent2, Pc)

% Single Crossover
    Gene_no = length(parent1.Gene);
    ub = Gene_no - 1;
    lb = 1;
    Cross_P = round (  (ub - lb) *rand() + lb  );
        
    Part1 = parent1.Gene(1:Cross_P);
    Part2 = parent2.Gene(Cross_P + 1 : Gene_no);
    child1.Gene = [Part1, Part2];
       
    Part1 = parent2.Gene(1:Cross_P);
    Part2 = parent1.Gene(Cross_P + 1 : Gene_no);
    child2.Gene = [Part1, Part2];
       
    R1 = rand();
    if R1 <= Pc
        child1 = child1;
    else
        child1 = parent1;
    end

    R2 = rand();
    if R2 <= Pc
        child2 = child2;
    else
        child2 = parent2;
    end
end