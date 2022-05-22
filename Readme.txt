#127 Feature Selection for Biomedical Patterns
Author: Yilong Wang

This folder contains several code files:
GA: Genetic Algorithm with proposed algorithm structure, the popution sizeis 30 and generation is 100. This gives 6000 evaluations as the 
program terminates.
GA_C: Genetic algorithm with concentional structure, the popution size is 30 and generation is 200. This gives 6000 evaluations as the 
program terminates.
GA_main: A file is used to call GA and record its performance in 10 independent runs.
GA_Cmain:A file is used to call GA_C and record its performance in 10 independent runs.
fhd.m: Fitness evaluation function(KNN,k=5), takes feature subsets( ant paths) as input, ouputs accuracy fitness
Tenfold.m: 10 fold cross validation(KNN,k=5), takes gbest(Glbal best feature subset) as input, outputs accuracy fitness
