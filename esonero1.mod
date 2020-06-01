set X;
set Y;
set M1;
set M2;

param c{X union Y};

param b{M1 union M2};
param A{M1 union M2, X union Y};

var x{X} >= 0;
var y{Y} >= 0;

minimize FO:
    sum{i in X} c[i]*x[i] + sum{i in Y} c[i]*y[i]
;
subject to v1 {i in M1}:
    sum{j in X} A[i, j]*x[j] + sum{j in Y} A[i, j]*y[j] <= b[i]
;
subject to v2 {i in M2}:
    sum{j in X} A[i, j]*x[j] >= b[i]
;