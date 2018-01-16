clear 
 	
load('Spike_data_4')
 
neuronNum=129; %examine neuron 129

%bin firing rates for each direction
spikeCount=zeros(8,1);
for i=1:8
    indDir=find(direction==i); %find trials in a given direction
    numTrials(i)=length(indDir);
    
    for j =1:numTrials(i)
        centerTime=go(indDir(j)); %to center on start of "go" cues
 
        allTimes=unit(neuronNum).times-centerTime; %center spike times
        spikeCount(i)=spikeCount(i)+sum(allTimes>-1&allTimes<1); %pick 2 seconds around center time
    end  
    %divide by the number of trials & bin size (2 s) for an average firing rate
    spikeCount(i)=spikeCount(i)/numTrials(i)/2;
end
 
%plot tuning curve
figure
ang = [0:45:315]; %angles for 8 directions 
plot(ang,spikeCount,'o-')
xlabel('Angle')
ylabel('Avg Firing Rate (Hz)')
areaName=unit(neuronNum).area;
title([areaName '- neuron ' num2str(neuronNum)])

%preferred direction (in degrees)
[p, prefDir]=max(spikeCount);
ang(prefDir)

