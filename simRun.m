function [optim_matrix] = simRun(design_matrix)
run Constant_Matrix.m

[row,col]=size(design_matrix);
optim_matrix = zeros(8, col);

for ii=1:row
    design_mat = design_matrix(ii,:)';
    assignin('base','design_mat',design_mat);
    xz_values = sim('Project_Model2021a',[0 10]);     % for MATLAB Version 2021a
%   xz_values = sim('Project_Model2020b',[0 10]);     % for MATLAB Version 2020b
%   xz_values = sim('Project_Model2020a',[0 10]);     % for MATLAB Version 2020a
    
    st_val=90;                      % percentage of final value to be assumed as steady state
    t0=1.8*log(1/(1-st_val*0.01));  % at st_val% of final value, steady state is achieved 
    i=find(xz_values.tout<=t0);
    
    optim_matrix(1,ii) = max(xz_values.xz([2:i(end)],1));         % transient_max_x
    optim_matrix(2,ii) = max(xz_values.xz([i(end)+1:end],1));     % steady_max_x
    optim_matrix(3,ii) = max(xz_values.xz([2:i(end)],2));         % transient_max_z
    optim_matrix(4,ii) = max(xz_values.xz([i(end)+1:end],2));     % steady_max_z

    optim_matrix(5,ii) = min(xz_values.xz([2:i(end)],1));         % transient_min_x
    optim_matrix(6,ii) = min(xz_values.xz([i(end)+1:end],1));     % steady_min_x
    optim_matrix(7,ii) = min(xz_values.xz([2:i(end)],2));         % transient_min_z
    optim_matrix(8,ii) = min(xz_values.xz([i(end)+1:end],2));     % steady_min_z
    
end
end