function plot_regression(grade)
    pop_table = readtable("data/pop_regression.csv","VariableNamingRule",'preserve');
    %pop_table.Properties.VariableNames={'Anno', 'Nordovest', 'Nordest', 'Centro','Sud','Isole'};
    years= pop_table{:,1} ;
    n_regions= length(pop_table.Properties.VariableNames)-1;
    
    %vettore di colori per il grafico
    point_colors=["ro","go","bo","mo","ko"];
    line_colors=["r--","g--","b--","m--","k--"];
    legenda=[];
    errori=[];
    figure();
    for j=1:n_regions
        %1)polinomio di regressione
        pop_values= pop_table{:,j+1};
        [reg_poly,S,mu]  = polyfit(years,pop_values,grade);
        x_reg= years;
        y_reg= polyval(reg_poly,x_reg,[],mu);
        %2)Plot di punti e di polinomio di regressione
        plot(years,pop_values, point_colors(j));
        hold on;
        plot(x_reg,y_reg, line_colors(j));
        legenda=[legenda ,string(pop_table.Properties.VariableNames{j+1}), string(pop_table.Properties.VariableNames{j+1})+"(stima)" ];
    end
        grid on;
        legend(legenda, 'location','northwest');
        s=sprintf("(grade %s)",string(grade));
        title("Regression analysis "+s);
end