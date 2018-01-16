load Spike_data_1.mat
ISI = [];
for k=1:n_trials
    spike_times = find(d(k,:) == 1);
    isi0 = diff(spike_times);
    ISI = [ISI,isi0];
end

plot(ISI)