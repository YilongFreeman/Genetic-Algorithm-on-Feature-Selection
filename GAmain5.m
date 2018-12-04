CaseTest='lungCancer_005';

switch(CaseTest)
    
    %K=5, Mutataion=0.05 Distance=Euclidean,Algirthm GA
    case 'lungCancer_005'
        clc
        clear
        
        load 'lungCancer.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.05;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10; % Average accuracy
        n_avr=sum(N_E)/10;%Average number of features
        save('5_GA_lungCancer_005E.mat')
        
        
    case 'wdbc_005'
        clc
        clear
        
        load 'wdbc.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.05;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_wdbc_005E.mat')
        
    case 'LSVT_005'
        
        clc
        clear
        load 'LSVT.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.05;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_LSVT_005E.mat')
        
    case 'arrthythmia_005'
        clc
        clear
        load 'arrthymia.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.05;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_arrthymia_005E.mat')
        
        %K=5, Mutataion=0.1 Distance=Euclidean,Algirthm GA
        
    case 'lungCancer_01'
        clc
        clear
        
        load 'lungCancer.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.1;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_lungCancer_01E.mat')
        
    case 'wdbc_01'
        clc
        clear
        
        load 'wdbc.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.1;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_wdbc_01E.mat')
        
    case 'LSVT_01'
        
        clc
        clear
        load 'LSVT.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.1;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_LSVT_01E.mat')
        
    case 'arrthythmia_01'
        
        clc
        clear
        load 'arrthymia.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.1;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_arrthymia_01E.mat')
        
        %K=5, Mutataion=0.2 Distance=Euclidean,Algirthm GA
        
    case 'lungCancer_02'
        clc
        clear
        
        load 'lungCancer.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.2;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_lungCancer_02E.mat')
        
    case 'wdbc_02'
        clc
        clear
        
        load 'wdbc.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.2;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_wdbc_02E.mat')
        
    case 'LSVT_02'
        clc
        clear
        load 'LSVT.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.2;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_LSVT_02E.mat')
        
    case 'arrthythmia_02'
        clc
        clear
        load 'arrthymia.mat'
        for kk=1:10
            %Giving the best position, which is the best combination
            mut_rate=0.2;
            [gbestval,gbest]=GA(@fhd,uv,yv,D,var_n,K,mut_rate);
            Record(kk,1)=gbestval;
            %Knn Ten fold performance
            [Avrage_Accuracy]=Tenfold(gbest,uv,yv,K,D);
            J(kk,1)=Avrage_Accuracy;
            N_E(kk,1)=sum(gbest);
        end
        J_X=sum(J)/10;
        n_avr=sum(N_E)/10;
        save('5_GA_arrthymia_02E.mat')
    otherwise
        fprintf('Invalid data\n' );
end

