function [Tp] = moment( f )
%MOMENT Summary of this function goes here
%   Detailed explanation goes here
%rgb2gray(f);
N=size(f,2);
Tp=zeros(N,1);
 t=poly(N);
%t=computePolyMatrix(N);
for p=1:1:N
    
       somme=0;
        for x=1:1:N
            
           somme=somme+t(x,p)* f(x);
           
        end
        
         Tp(p)=somme;
end
      
end