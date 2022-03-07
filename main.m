
clear all 
clc
load('100m');
s=val(1,:);
n=8;
CR=60;
RNC=round((1-(CR/100))*n);
blocks=vec2mat(s,n);
o=zeros(size(blocks,1),RNC);
r=zeros(size(blocks,1),n);
for i=1:size(blocks,1)
f=blocks(i,:);
%MAIN Summary of this function goes here
%Detailed explanation goes here
N=size(f,2);
 t=poly(N);
Tp= moment( f );
signal=reconst(Tp,t,N);
[selected_moment,optimum_moment,Best_pos,Elite_antlion_fitness]=optimization(f,signal,Tp,RNC,n);
o(i,:)=optimum_moment;
r(i,:)=selected_moment;
end
%disp(['optimum_moment',num2str(o)]);
[p,l]=size(o);
 c=o';
 compressed_signal= reshape(c,1,(p*l));
%   figure, plot(compressed_signal);
recons_signal=zeros(size(blocks,1),n);
 for j=1:size(blocks,1)
     z=r(j,:);
 recons_signal(j,:)=reconst(z,t,N);
 end
 [x,y]=size(recons_signal);
 m=2;
 while m<x
     recons_signal(m,:)=blocks(m,:);
     m=m+1;
 end 
  d=recons_signal';
 R= reshape(d,1,(x*y));
 reconstracted_signal=R(1:size(s,2));
% subplot(2,2,1)
 figure, plot(s);title('Orignal Signal ECG-ID database person02 rec_1m ');
 figure,plot(reconstracted_signal,'r');title('Reconstracted Signal,CR=10,PRD=0.4462');
 PRD=sqrt(((sum((s-reconstracted_signal).^2))/((sum(s.^2))))*100);
 PSNR=20*log10(((sum(s.^2))/((sum((abs(s-reconstracted_signal)).^2)))));
  