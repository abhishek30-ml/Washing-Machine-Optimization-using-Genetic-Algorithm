
function [BestChrom]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , obj, visuailzation)

cgcurve = zeros(1 , MaxGen);

%  Initialization
[ population ] = initialization(M, N);
design_matrix = decoder(population);                % Size 20x6
fit = obj(design_matrix);                     
for i = 1 : M
    population.Chromosomes(i).fitness = fit(i);
end

g = 1;
disp(['Generation #' , num2str(g)]);
[~ , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
cgcurve(g) = population.Chromosomes(indx(1)).fitness;

% Main loop
for g = 2 : MaxGen
    disp(['Generation #' , num2str(g)]);
    % Calcualte the fitness values
    design_matrix = decoder(population);
    fit = obj(design_matrix);                   
    for i = 1 : M
        population.Chromosomes(i).fitness = fit(i);
    end

    
    for k = 1: 2: M
        % Selection
        [ parent1, parent2] = selection(population);
        
        % Crossover
        [child1 , child2] = crossover(parent1 , parent2, Pc);
        
        % Mutation
        [child1] = mutation(child1, Pm);
        [child2] = mutation(child2, Pm);
        
        newPopulation.Chromosomes(k).Gene = child1.Gene;
        newPopulation.Chromosomes(k+1).Gene = child2.Gene;
    end
    
    design_matrix = decoder(newPopulation);
    fit = obj(design_matrix);                    
    for i = 1 : M
        newPopulation.Chromosomes(i).fitness = fit(i);
    end

    % Elitism
    [ newPopulation ] = elitism2(population, newPopulation, Er);
    
    cgcurve(g) = newPopulation.Chromosomes(1).fitness;
    
    population = newPopulation; % Replace the previous population with the newly made
end

   
BestChrom.Gene    = population.Chromosomes(1).Gene;
BestChrom.Fitness = population.Chromosomes(1).fitness;


if visuailzation == 1
    figure(1)
    plot( 1 : MaxGen , cgcurve);
    xlabel('Generation');
    ylabel('Fitness of the best elite')
end


end