
function [selected_moment,optimum_moment,Best_pos,Elite_antlion_fitness]=optimization(f,signal,Tp,RNC,n)
SearchAgents_no=3; % Number of search agents
Max_iteration=10;
dim=RNC;
lb=1;
ub=n;
[Best_pos,Elite_antlion_fitness]=ALO(SearchAgents_no,Max_iteration,lb,ub,dim,f,signal);
optimum_moment=zeros(1,RNC);
  selected_moment=zeros(1,n);
for i=1:RNC
    m=round(Best_pos(i));
    optimum_moment(i)=Tp(m);
   selected_moment(m)=Tp(m);
end

end

