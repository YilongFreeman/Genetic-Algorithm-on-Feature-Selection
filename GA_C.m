%This file is intened to perform Genetic  Algorithm in a conventional
%strcutrue
% The change of Ant_Size and genertion_n would impact on its performance

function [gbestval,gbest]=GA_C(fhd,uv,yv,D,var_n,K,mut_rate)
% Initial parameters of GA
generation_n =100;	% Number of generations
popuSize = 30;		% Population size
xover_rate=0.8;
popu = rand(popuSize,var_n) > 0.5;
gbestval=0;

for i = 1:generation_n
    % ====== fitness evaluation
    [fitness]=fhd(popu,uv,yv,popuSize,D,K);%tr_data);
    [iterBestval, index] = max(fitness);
    % Update Gbest ------------------
    if iterBestval>gbestval
        gbestval=iterBestval;
        gbest=popu(index,:);
    end
    
    new_popu = popu;
    
    % ====== ELITISM: find the best two and keep them
    
    % Use a for loop to generate the best two result
    best=max(fitness);
    index1=find(fitness==best,1,'first');
    
    second=max(fitness(fitness<max(fitness)));
    if isempty(second)
        index2=3;
    else
        
        index2=find(fitness==second,1,'first');
    end
    
    %Selection
    Ctotal=cumsum(fitness);
    Total=sum(fitness);
    Pick1=(Total*rand);
    parent1_Index= find(Ctotal>Pick1,1);
    Pick2=(Total*rand);
    parent2_Index= find(Ctotal>Pick2,1);
    parent1=popu(parent1_Index, :);
    parent2=popu(parent2_Index, :);
    
    %One Point CrossOver
    for x = 2:popuSize/2
        if rand < xover_rate
            % Perform crossover operation
            xover_point = ceil(rand*(var_n-1));
            new_popu(x*2-1, :) = ...
                [parent1(1:xover_point) parent2(xover_point+1:var_n)];
            new_popu(x*2, :) = ...
                [parent2(1:xover_point) parent1(xover_point+1:var_n)];
        end
    end
    
    % ====== MUTATION (elites are not subject to this.)
    mask = rand(popuSize, var_n) < mut_rate;
    new_popu = xor(new_popu, mask);
    % restore the elites
    new_popu([1 2], :) =popu([index1 index2],:);
    popu =new_popu;
end


end