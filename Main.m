% Main 
clear
clc

% Controling paramters of the GA algortihm
Problem.obj = @fitness_fn;
Problem.nVar = 18;

M = 20;            % Number of chromosomes (cadinate solutions)
N = Problem.nVar;  % Number of genes (variables)
MaxGen = 15;
Pc = 0.85;
Pm = 0.01;
Er = 0.05;
visualization = 0; % Set to 0 if you do not want the convergence curve 

[BestChrom]  = GeneticAlgorithm (M , N, MaxGen , Pc, Pm , Er , Problem.obj , visualization);
disp('1')
disp('The best chromosome found: ')
gene = BestChrom.Gene;
disp('The best fitness value: ')
BestChrom.Fitness;

mat = decoder_array(gene);
design_mat0 = mat(1,:);
design_mat0 = design_mat0';
