set X;
set M1;
set M2;
set M3;

param c{X};
param b{M1 union M2 union M3} ;
param A{M1 union M2 union M3, X};


var x{X} >= 0;
var y >= 0;

minimize FO:
    y + sum{i in X} c[i]*x[i]
;

subject to v1 {i in M1}:
    sum{j in X} A[i, j]*x[j] <= b[i] + y
;

subject to v2 {i in M2}:
    sum{j in X} A[i, j]*x[j] <= b[i]
;


subject to v3 {i in M3}:
    sum{j in X} A[i, j]*x[j] >= b[i]
;