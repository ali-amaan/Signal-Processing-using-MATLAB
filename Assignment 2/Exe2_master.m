%% Exersice 2 master program

clear all; 
close all; 

%% Exercise 2.1

% lin to dB conversion, do not modify the input signals
A1 = 2;
A2 = linspace(1,10,10);
A3 = ones(16,16);
Exe2_1_answer1 = Exe2_1(A1,1)
Exe2_1_answer2 = Exe2_1(A2,1)
Exe2_1_answer3 = Exe2_1(A3,1)

%% Exercise 2.2

% 'IR.mat' contains Impulse response vector and fs for the sample. Produce
% working fft function which plots the frequency response of the Impulse
% response of the IR in frequency scale

load('IR.mat');
Exe2_2_answer = Exe2_2(irN,fs);
Ave2_2 = mean(Exe2_2_answer)

%% Exercise 2.3 
% This time you have to load all the data in your function. Produce one
% sided fft function. with dB scaling. (reference = 1). Plot the resulting
% fft with frequency axle. The data includes some noisy transients, so pick
% the data from "clean" part of the signal. Pick at least 8 heart beats
% from the signal. 
filename = 'data.mat';
Exe2_3_answer = Exe2_3(filename);
Ave2_3= mean(Exe2_3_answer)