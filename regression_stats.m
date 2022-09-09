function regression_stats(grade)%Importo i dati dal file.txt

    pop_table = readtable("data/pop_regression.csv","VariableNamingRule",'preserve');
    %pop_table.Properties.VariableNames={'Anno', 'Nordovest', 'Nordest', 'Centro','Sud','Isole'};
    years= pop_table{:,1} ;
    n_regions= length(pop_table.Properties.VariableNames)-1;
    errori=[];
    for j=1:n_regions
        %1)polinomio di regressione
        pop_values= pop_table{:,j+1};
        [reg_poly,S,mu]  = polyfit(years,pop_values,grade);
        x_reg= years;
        y_reg= polyval(reg_poly,x_reg,[],mu);
        %2)Valutazione dell'errore sui dati di cui disponiamo
        scarti=pop_values-y_reg;
        err= sum(scarti.^2);
        errori=[errori , err];
    end

    %stampo errori del modello per ogni :
    fprintf("\n--------------------------------------")
    fprintf("\n Errori del modello per ciascuna zona:")
    fprintf("\n--------------------------------------")
    for k=1:n_regions
        fprintf("\n Errore %s --->%d ",pop_table.Properties.VariableNames{k+1},errori(k))
    end
    fprintf("\n");
    fprintf('ERRORE MEDIO TOTALE DEL MODELLO-->%d\n', mean(errori));
end
