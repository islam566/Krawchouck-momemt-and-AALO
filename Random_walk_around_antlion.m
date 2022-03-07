
%___________________________________________________________________%
%  Ant Lion Optimizer (ALO) source codes demo version 1.0           %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper:                                                     %
%                                                                   %
%   S. Mirjalili, The Ant Lion Optimizer                            %
%   Advances in Engineering Software , in press,2015                %
%   DOI: http://dx.doi.org/10.1016/j.advengsoft.2015.01.010         %
%                                                                   %
%___________________________________________________________________%

% This function creates random walks

function [RWs]=Random_walk_around_antlion(dim,max_iter,lb, ub,antlion,current_iter)
if size(lb,1) ==1 && size(lb,2)==1 %Check if the bounds are scalar
    lb=ones(1,dim)*lb;
    ub=ones(1,dim)*ub;
end

if size(lb,1) > size(lb,2) %Check if boundary vectors are horizontal or vertical
    lb=lb';
    ub=ub';
end

I=1; % I is the ratio in Equations (2.10) and (2.11)

if current_iter>max_iter*(0.02)          
    I=1+100*(current_iter/max_iter);
end

if current_iter>max_iter*(0.05)          
    I=1+1000*(current_iter/max_iter);
end

if current_iter>max_iter*(0.11)          
    I=1+10000*(current_iter/max_iter);
end

if current_iter>max_iter*(0.21)
    I=1+100000*(current_iter/max_iter);
end

if current_iter>max_iter*(0.36)
    I=1+1000000*(current_iter/max_iter);
end

if current_iter>max_iter*(0.66)
   I=1+10000000*(current_iter/max_iter);
end


% Dicrease boundaries to converge towards antlion
lb=lb/(I); % Equation (2.10) in the paper
ub=ub/(I); % Equation (2.11) in the paper

% Move the interval of [lb ub] around the antlion [lb+anlion ub+antlion]
if rand<0.5
    lb=lb+antlion; % Equation (2.8) in the paper
else
    lb=-lb+antlion;
end

if rand>=0.5
    ub=ub+antlion; % Equation (2.9) in the paper
else
    ub=-ub+antlion;
end

% This function creates n random walks and normalize accroding to lb and ub
% vectors 
% for i=1:dim
%     X = [0 cumsum(2*(rand(max_iter,1)>0.5)-1)']; % Equation (2.1) in the paper
%     %[a b]--->[c d]
%     a=min(X);
%     b=max(X);
%     c=lb(i);
%     d=ub(i);      
%     X_norm=((X-a).*(d-c))./(b-a)+c; % Equation (2.7) in the paper
%     RWs(:,i)=X_norm;
% end
r=rand(1,dim).*(ub-lb)+lb;
beta=3/2;
sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
u=randn(size(r))*sigma;
 v=randn(size(r));
 step=u./abs(v).^(1/beta);
    stepsize=0.01*step.*(r-antlion);
    x=stepsize.*randn(size(r));
   RWs=x;

