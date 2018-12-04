%This file is intened to perform Genetic Algorithm with proposed
%in a proposed algorithm structure
%The change of Ant_Size and genertion_n would impact on its performance

function [gbestval,gbest]=GA(fhd,uv,yv,D,var_n,K,mut_rate)
% Initial parameters of GA
generation_n =100;	% Number of generations
popuSize = 30;		% Population size
Global_second=0;
popu = rand(popuSize,var_n) > 0.5;
gbestval=0;
xover_rate=0.8;

for i = 1:generation_n
    % ====== fitness evaluation
    [fitness]=fhd(popu,uv,yv,popuSize,D,K);%tr_data);
    
    % ====== ELITISM: find the best two and keep them
    [best, index1]=max(fitness);
    if best>gbestval
        gbestval=best;
        gbest=popu(index1,:);
    else
        popu(1,:)=gbest(1,:);
        fitness(1,1)=gbestval;
    end
    
    second=max(fitness(fitness<max(fitness)));
    index2=find(fitness==second,1,'first');
    if second>Global_second
        Secondbest=popu(index2,:);
        Global_second=second;
    else
        popu(2,:)=Secondbest;
        second=Global_second;
        fitness(2,1)=second;
    end
    
    new_popu=popu;
    
    % Use a for loop to generate the best two result
    
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
    
    new_popu(1,:)=gbest;
    new_popu(2,:)=Secondbest;
    
    %Second evaluation for directional search fitness result
    [fitness]=fhd(new_popu,uv,yv,popuSize,D,K);%tr_data);
    
    % ====== ELITISM: find the best two and keep them
    [best, index]=max(fitness);
    if best>gbestval
        gbestval=best;
        gbest=new_popu(index,:);
    else
        new_popu(1,:)=gbest(1,:);
        
    end
    
    second2=max(fitness(fitness<max(fitness)));
    if isempty(second2)
        index4=3;
    else
        index4=find(fitness==second2,1,'first');
    end
    
    if second2>Global_second
        Secondbest=new_popu(index4,:);
        Global_second=second2;
    else
        new_popu(2, :)=Secondbest;
    end
    
    % ====== MUTATION (elites are not subject to this.)
    mask = rand(popuSize, var_n) < mut_rate;
    new_popu = xor(new_popu, mask);
    popu =new_popu;
    
end


end