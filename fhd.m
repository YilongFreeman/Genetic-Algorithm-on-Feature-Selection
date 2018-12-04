function [fitness]=fhd(popu,uv,yv,popuSize,D,K)
%This function is to calculate the chrosomes' fitness of one generation 
fitness=zeros(popuSize,1);
for j=1:popuSize
    % Find the chrosome information, what features active and sleep
    Active_Features=find(popu(j,:));
    Chrosome_Infor=uv(:,Active_Features);
    Acc_One_Fifth=zeros(K,1);
    % ====== fitness evaluation using 10-90% Knn(10% test, 90% Train)
    % Set up the training data and test data
        for z=1:K
            One_Fifth_Test = (D==z);
            One_Fifth=find(One_Fifth_Test);
            Num=size(One_Fifth);
            Num=Num(1,1);
            Four_Fifth_Train =(~One_Fifth_Test);
            Four_Fifth=find(Four_Fifth_Train);
            training = Chrosome_Infor(Four_Fifth,:);
            trainingResponse = yv(Four_Fifth,:);
            %Set up the model
            Mdl =fitcknn(training,trainingResponse,'NumNeighbors',5,'Distance','euclidean');
            % Test data set
            sample =Chrosome_Infor(One_Fifth,:);
            %Knn model prediction on test data set
            %Make prediction
            Prediction= predict(Mdl,sample);
            %The original identification of test data set
            Original = yv( One_Fifth,:);
            %If the data is matched with original data, then it is true. it will
            %become '1' in the (==0) conditioner. Sum of all the true to find out
            %the accuracy of the model
            L=Original-Prediction;
            Acc_One_Fifth(z,1) =sum(L==0)/Num;
        end
    
    fitness(j,1) = mean(Acc_One_Fifth);
       end
end
