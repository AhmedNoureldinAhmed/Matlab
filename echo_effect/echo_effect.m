% -------------------- Program to Produce Echo effect ------------------ % 

% Echo means => delayed version of original signal
% if one signal come directly to your ear and another which same signal but
% with some delay is come to your ear then you will feel that's echo 

% Consider system with input signal x(n) pass through system(H) and produce output singal y(n) 
%                --------
%    x(n) --->| h(n) | ---> y(n) 
%                --------
% first step define expression of h(n) 
% from lecture    y(n) = x(n) + ? x(n-N)   
% take z-transform to determine numerator and denominator for coefficient


% First determine Sampling Frequency for system 
% Sampling frequency (sampling rate), Fs, is the average number of samples obtained in one second (samples per second), thus Fs = 1/T
% Sampling Frequency at 1 second ( Delay for 1 Second  )
fs = 44100; 

% read sound 
y = audioread('sample.mp3'); 
 
% alpha = 0.9  ( 0  < alpha < 1 ) determine how long the echo lasts and what it sounds like.
% zeros(1,8000) more number of zeros indicats more delay in singal ( How much dealy you want )
num = [1,zeros(1,8000),0.9];   
                                  
den = [1];

% Filter function is used to filter the input signal using a system 
x = filter(num,den,y); 

% play normal sound 
% p1 = audioplayer(y,fs);

% play sound with filter 
p1 = audioplayer(x,fs);


play(p1);
%stop(p1)