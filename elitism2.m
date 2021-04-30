function [ newPopulation2 ] = elitism2(population , newPopulation, Er)

M = length(population.Chromosomes); % number of individuals 
Elite_no = round(M * Er);

[~ , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
[~ , indx_new] = sort([ population.Chromosomes(:).fitness ] , 'descend');
    
% The elites from the previous population
for k = 1 : M
    
    if newPopulation.Chromosomes(indx_new(k)).fitness >= population.Chromosomes(indx(k)).fitness
        
        newPopulation2.Chromosomes(k).Gene = newPopulation.Chromosomes(indx_new(k)).Gene;
        newPopulation2.Chromosomes(k).fitness = newPopulation.Chromosomes(indx_new(k)).fitness;
    else
        newPopulation2.Chromosomes(k).Gene = population.Chromosomes(indx(k)).Gene;
        newPopulation2.Chromosomes(k).fitness = population.Chromosomes(indx(k)).fitness;
    end
end

end