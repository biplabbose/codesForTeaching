% Generating plots of different continous distributions that look like
% Normal distribution.
% Here we are plotting PDFs.
% Parameter values are selected to create similar looking figures.
% Note that I have used array operators (./, .*, .^) in function
% definations to avoid Matlab throwing warning message.

% Script written by Biplab Bose, IIT Guwahati Nov 2022

clear
clc
close all

figure(1)

% Normal ditribution
subplot(2,3,1)
mu = 0;
std_dev = 1;
fx_normal = @(x) (1/(std_dev*sqrt(2*pi)))*exp(-0.5*((x - mu)/std_dev).^2);
fplot(fx_normal);
title('Normal distribution','FontWeight', 'normal'); 

% t-distribution
subplot(2,3,2)
df = 3;
fx_t = @(x) gamma((df+1)/2)*(1/(sqrt(df*pi)*gamma(df/2)))*...
    (1+(x.^2)/df).^(-(df+1)/2);
fplot(fx_t);
title('t-distribution','FontWeight', 'normal'); 


% logistic distribution
subplot(2,3,3)
mu = 0;
s = 1;
fx_logit = @(x) exp(-(x - mu)/s)./(s*(1+exp(-(x - mu)/s)).^2);
fplot(fx_logit);
title('Logistic distribution','FontWeight', 'normal'); 

% log-normal distribution
subplot(2,3,4)
mu = 0;
std_dev = 0.25;
fx_lognorm = @(x) (1./(x*std_dev*sqrt(2*pi)))...
    .*exp(-0.5*((log(x) - mu)/std_dev).^2);
fplot(fx_lognorm, [0 3]);
title('Log-normal distribution','FontWeight', 'normal'); 

% Weibull distribution
subplot(2,3,5)
L = 1;
K = 5;
fx_w = @(x) (K/L)*((x/L).^(K-1)).*exp(-(x/L).^K);
fplot(fx_w, [0 3]);
title('Weibull distribution','FontWeight', 'normal');

% F distribution
subplot(2,3,6)
d1 = 100;
d2 = 100;
fx_F = @(x) gamma((d1+d2)/2)*((d1/d2)^(d1/2))*(x.^((d1/2)-1))./...
    (gamma(d1/2)*gamma(d2/2)*((1+(d1*x/d2)).^((d1+d2)/2)));
fplot(fx_F, [0 3]);
title('F-distribution','FontWeight', 'normal');

% save the figure
exportgraphics(gcf,'distributions.jpg','Resolution',300);