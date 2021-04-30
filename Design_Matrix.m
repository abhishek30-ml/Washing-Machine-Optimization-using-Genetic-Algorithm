% Design parameters

%design_mat =k |        3000       5000
%            c |       364.3        380
%          xs1 |      0.0729     0.0729
%          zs1 |      0.1717     0.1717
%          xd1 |      0.0871     0.0871
%          zd1 |      0.1459     0.1459

k = [3000 5000]; %Spring Constant
c = [364.3 380]; %Damping Constant
xs1 = 0.0729*ones(1,2); zs1 = 0.1717*ones(1,2);
xd1 = 0.0871*ones(1,2); zd1 = 0.1459*ones(1,2);

xs2 = xs1; zs2 = zs1;
xd2 = xd1; zd2 = zd1;
design_mat = [k; c; xs1; zs1; xd1; zd1];