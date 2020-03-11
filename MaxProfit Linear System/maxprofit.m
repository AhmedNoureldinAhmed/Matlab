%Declare the system of equations.
syms m y 
eqns = [  2*m + 3*y  == 4*10^5;
 3*m + 1.5 *y == 3*10^5;
m == 9*10^4;
m  == 0;
 y  == 0 ];

maxProfit = 0

for i = 1 : 4 
        for ( j = i+1 : 5 ) 
            
%Use equationsToMatrix to convert the equations into the form AX = B.
[A,B] = equationsToMatrix([eqns(i), eqns(j)], [m, y]);

%Use linsolve to solve AX = B for the vector of unknowns X.
X = linsolve(A,B);


%Check constraints 
if ( X(1) <= (9*10^4) )
if ( X(1) >= 0 )
if ( X(2) >= 0)
             if ( 2*X(1) + 3*X(2)  <= 4*10^5 )
             if ( 3*X(1) + 1.5 *X(2) <= 3*10^5)
                 
           % Calc Obj Funtion   
            z = 0.65 *X(1) + 0.45 * X(2); 
            
            if ( z > maxProfit )
                maxProfit = z ; 
end 
end
end
end
end
end          
end
end

maxProfit

