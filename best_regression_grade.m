clear all;
close all;
%Grado del polinomio fino a 7
errors= zeros(1,7);
for i=1:7
    errors(i)=regression_mean_error(i);
end
best_grade= find(errors==min(errors));
fprintf("Best grade for our polynomial regression is: %d",best_grade)
