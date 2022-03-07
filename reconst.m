function [ f ] = reconst(Tp,tn,N)
%RECONSTRUCTION Summary of this function goes here
%   Detailed explanation goes here
f=zeros(1,N);
for x=1:1:N
    
        somme=0;
        for n=1:1:N
            
                somme=somme+Tp(n)*tn(x,n);
            
        end
          f(x)=somme;
          double(f);
          disp(f)
end
  
end