clc
close all
clear all
sig=load('ecg.txt')
sig=sig(1:500);
plot(sig)
hold on 
plot(sig, 'ro')
beat_count=0;
for k=2:length (sig)-1
    if(sig(k)>sig(k-1) & sig(k)>sig(k+1) & sig(k)>1)
        disp('Prominent peak found')
        k
       beat_count=beat_count+1
    end
end
beat_count
fs=100;
N=length(sig);
duration_in_seconds=N/fs;
duration_in_minutes=duration_in_seconds/60
BPM= beat_count/duration_in_minutes