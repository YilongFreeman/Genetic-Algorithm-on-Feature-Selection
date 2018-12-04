function[Avrage_Accuracy]= Tenfold(gbest,uv,yv,K,D)
%This fucntion is to find the average accuracy of 10-fold cross-validation
%in use of the data from Genetic Algorithm recommendation 
Active=find(gbest);
Accuracy=zeros(K,1);
for i=1:K
    %Setting up training data and testing data
    GA_Features=uv(:,Active);
    One_Tenth_Test = (D==i);
    One_Tenth=find(One_Tenth_Test);
    sample_oneTenth=GA_Features(One_Tenth,:);
    Num=size(One_Tenth);
    Num=Num(1,1);
    Nine_Tenth_Train =(~One_Tenth_Test);
    Nine_Tenth=find(Nine_Tenth_Train);
    
    training = GA_Features(Nine_Tenth,:);
    Traning_Response = yv(Nine_Tenth,:);
    
    %Create an Knn model 
    Mdl =fitcknn(training,Traning_Response,'NumNeighbors',5,'Distance','euclidean');
    %Knn model prediction on test data set
    grouphat = predict(Mdl,sample_oneTenth);
    %The original identification of test data set
    group = yv(One_Tenth,:);
    %If the data is matched with original data, then it is true. it will
    %become '1' in the (==0) conditioner. Sum of all the true to find out
    %the accuracy of the model
    E=group-grouphat;
    E=sum(E==0);
    Accuracy(i,1) = E/Num;
end
Avrage_Accuracy=mean(Accuracy);
return