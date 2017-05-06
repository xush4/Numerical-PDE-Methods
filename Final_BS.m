function [V, dtau, S]=Final_BS(K, sigma, r, T, type, n)
% Finite Volume Method for Black-Shole Model
% K: Strike Price;  Sigma: Viobility
% r: Interest Rate; T: time of mature (exercise)
% S: Asset Price;   V: value of the option
% n: devide each point of Original S into 2^(n-1) meshes.
% type: put or call

%initialize
S = K/100*[0:20:60 61:4:89 90:0.8:110 111:4:139 140:20:200 300 500 1000 5000];
for i=1:n-1
 Sn(1:2:length(S)*2) = S;
 Sn(2:2:length(S)*2-1) = (S(2:length(S)) -S(1:length(S)-1))/2 + S(1:length(S)-1);
 S = Sn;
end

%time_steps = round(365 *2^(n-1)* T);
time_steps = round(365 *8* T);
dtau = T/time_steps;

% V(t=T) = payoff at maturity
V = zeros(length(S),time_steps+1);
if strcmp(type,'put')
%Put
V(:,1) = max(K-S',0);
elseif strcmp(type, 'call') 
%Call
V(:,1) = max(S'-K,0);
end

% Assemble matrix
% define S_minus:S(i-1), Si, S_plus:S(i+1) 
S_minus = S(1:length(S)-2);
Si = S(2:length(S)-1);
S_plus = S(3:length(S));

% compute values for m_i_minus, m_i and m_i_plus according to the formula given
m_Diag = 1 + (sigma^2*Si.^2*dtau).*(1./( (S_plus-S_minus).*(S_plus-Si) ) +1./( (S_plus-S_minus).*(Si-S_minus) ) ) + r*dtau;
m_Diag = [1+r*dtau m_Diag 1]; % boundary condition
 
m_upper =-(sigma^2*Si.^2*dtau)./((S_plus-S_minus).*(S_plus-Si)) - Si.*r*dtau./(S_plus-S_minus);
m_upper = [0 m_upper];
m_lower = -(sigma^2*Si.^2*dtau)./((S_plus-S_minus).*(Si-S_minus)) + Si.*r*dtau./(S_plus-S_minus);
m_lower = [m_lower 0];
 
% assemble matrix M from diagonals and 2 subdiagonal
M = diag(m_Diag) + diag(m_lower,-1) + diag(m_upper,1);

% solve for V(t_0)
for tau=1:time_steps
 %V(:,tau+1) = HW5_Linear_GaussSeidel( M, V(:,tau), V(:,tau),200);
 %V(:,tau+1) = HW5_Linear_Jacobi( M, 2/3,V(:,tau), V(:,tau),200);
 V(:,tau+1) = M\V(:,tau);
end


