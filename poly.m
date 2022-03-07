
function [tn] = poly( N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m=0.8;
tn=zeros(N,N);
for x=1:1:N
     tn(x,1)=sqrt(((factorial(N))*(m^(x-1))*((1-m)^(N-(x-1))))/((factorial((x-1)))*(factorial(N-(x-1)))));
    tn(x,2)=((-m*(N-(x-1)))+((x-1)*(1-m)))*(sqrt(((factorial(N-1))*(m^((x-1)-1))*((1-m)^(N-(x-1)-1)))/((factorial((x-1)))*(factorial(N-(x-1))))));
     for n=3:1:N
         p=n-1;
          A=p;
          B=(x-1)-p+1-m*(N-2*p+2);
          C=-m*(1-m)*(N-p+2);
          D=sqrt(p/(m*(1-m)*(N-p+1)));
          E=sqrt((p*(p-1))/(((m*(1-m))^2)*(N-p+2)*(N-p+1)));
          tn(x,n)=((1/A)*(B)*(D)*(tn(x,n-1)))+((1/A)*(C)*(E)*(tn(x,n-2)));
      end
end
