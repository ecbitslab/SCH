function c_mat = spike_remove(mat)

%% Function spike_remove(mat) works on data generated from 'track_shift.m'
%% to correct for noise spikes encountered in processing data from a
%% shclieren experiment.

%% Variables:

% mat : an M x N matrix whos columns represent the data to be processed.
% Note for external data useage:  The first two colums of mat are assumed
% to be location (row column) coordinates for values within the matrix.  In
% order to use with other data, please pad with two colums of zeros.

% c_mat : the corrected matrix with spikes removed.

%% Process:



%% Begin Program

num_cols = size(mat,2) - 2;
num_bins = size(mat,1);

c_mat = zeros(size(mat));
c_mat(:,1) = mat(:,1);
c_mat(:,2) = mat(:,2);

for c_col = 1:1:num_cols
    n_dat = mat(:,c_col + 2);
    [freq val] = hist(abs(n_dat),num_bins);
    num_zeros = size(find(freq == 0),2);
    t1 = abs(max(n_dat));
    t2 = abs(min(n_dat));
    if t1 < t2
        t_val = t1;
    else
        t_val = t2;
    end
%     t_val = sqrt(t1 ^ 2 + t2 ^ 2);
%     t_val = (t1 + t2)/2;
    if t_val == 0
       t_val = .1; 
    end
    cut_off = max(find(freq == 0,ceil(t_val * num_zeros)));
    thresh = val(cut_off);
    c_vals = find(abs(n_dat) > thresh);
    n_dat(c_vals) = 0;
    c_mat(:,c_col + 2) = n_dat;
end
