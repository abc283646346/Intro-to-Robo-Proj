function [Traj_N,ek]=stompCompute_NoisyTraj(k,Start,End,R)
%THis function computes the noisy trajectory 

Num_k=10;
Traj=End-Start;
Step=[Start];
mu=zeros(1,k);
sigma=R;
Traj_N=cell(1,Num_k);

for i = 1 : k
    gap = Traj/k*(i-1);
    Step=[Step; Start+gap];
end

ek = mvnrnd(mu,sigma,Num_k);

for j = 1 : Num_k
    Traj_N(j)=Step+ek(j,:);
end

end