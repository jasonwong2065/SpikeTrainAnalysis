load Spike_data_1.mat
n_spikes_per_trial = [];
sum = 0;
first = 1%input('Starting index\n')
last = 1000%input('Ending index\n')
size = 1:(last-first+1);
for x = first:last
    n = numel(find(d(x,:) == 1));
    n_spikes_per_trial = [n_spikes_per_trial n];
end
%plot(size,n_spikes_per_trial(size),'-o')
hist(n_spikes_per_trial, [0:1:40]);
n_avg = mean(n_spikes_per_trial)
hold on
plot([n_avg, n_avg], [0,max(hist(n_spikes_per_trial, [0:1:40]))], 'r','LineWidth',2)
titleString = strcat('asdf',num2str(n_avg),' Title');
title(titleString);

hold off