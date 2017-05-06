%First Order Upwind
%dissipation
hx=0.01;
ht=0.01;
a=1;
lambda=a*ht/hx; %CFL condition.
S1=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS1=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); %No dissipation when lambda=1
xx=0:0.01:50;
x=xx(2:5001);
modx1=modS1(x);

hx=0.01;
ht=0.005;
a=1;
lambda=a*ht/hx; %CFL condition.
S2=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS2=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); 
modx2=modS2(x);

hx=0.01;
ht=0.002;
a=1;
lambda=a*ht/hx; %CFL condition.
S3=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS3=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); 
modx3=modS3(x);

hx=0.01;
ht=0.001;
a=1;
lambda=a*ht/hx; %CFL condition.
S4=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS4=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); 
modx4=modS4(x);

plot(x,modx1,x,modx2,x,modx3,x,modx4);
legend('hx=0.01, ht=0.01','hx=0.01, ht=0.005','hx=0.01, ht=0.002','hx=0.01, ht=0.001') 
xlabel('k');
ylabel('|S(k)|')
axis([0 50 0.8 1.1]);	

%Blow up: No CFL
hx=0.001;
ht=0.01;
a=1;
lambda=a*ht/hx; %CFL condition.
S5=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS5=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); 
modx5=modS5(x).^30;

hx=0.005;
ht=0.01;
a=1;
lambda=a*ht/hx; %CFL condition.
S6=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS6=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); 
modx6=modS6(x).^30;

hx=0.002;
ht=0.01;
a=1;
lambda=a*ht/hx; %CFL condition.
S7=@(K) 1-lambda+lambda*exp(-1i*k*hx);
modS7=@(k) abs(1-lambda+lambda*exp(-1i*k*hx)); 
modx7=modS7(x).^30;

plot(x,modx5, x,modx7, x,modx6);
legend('hx=0.001, ht=0.01','hx=0.002, ht=0.01','hx=0.005, ht=0.01')
xlabel('k');
ylabel('|S(k)|')
axis([0 50 0 30]);	

%First Order Upwind
% dispersion
hx=0.01;
ht=0.01;
a=1;
lambda=a*ht/hx; %CFL condition.
S=@(k) 1-lambda+lambda*exp(-1i*k*hx);
modS=@(k) abs(S(k)); %No dissipation when lambda=1
vph1= @(k) 1i*log(S(k)/modS(k))/k/ht;
xx=0:0.01:50;
x=xx(2:5001);
vx1=zeros(1,5000);
for j=1:5000
vx1(1,j)=vph1(x(j));
end

hx=0.01;
ht=0.001;
a=1;
lambda=a*ht/hx; %CFL condition.
S=@(k) 1-lambda+lambda*exp(-1i*k*hx);
modS=@(k) abs(S(k)); %No dissipation when lambda=1
vph2= @(k) 1i*log(S(k)/modS(k))/k/ht;
xx=0:0.01:50;
x=xx(2:5001);
vx2=zeros(1,5000);
for j=1:5000
vx2(1,j)=vph2(x(j));
end

hx=0.005;
ht=0.0001;
a=1;
lambda=a*ht/hx; %CFL condition.
S=@(k) 1-lambda+lambda*exp(-1i*k*hx);
modS=@(k) abs(S(k)); %No dissipation when lambda=1
vph3= @(k) 1i*log(S(k)/modS(k))/k/ht;
xx=0:0.01:50;
x=xx(2:5001);
vx3=zeros(1,5000);
for j=1:5000
vx3(1,j)=vph3(x(j));
end

hx=0.001;
ht=0.00001;
a=1;
lambda=a*ht/hx; %CFL condition.
S=@(k) 1-lambda+lambda*exp(-1i*k*hx);
modS=@(k) abs(S(k)); %No dissipation when lambda=1
vph4= @(k) 1i*log(S(k)/modS(k))/k/ht;
xx=0:0.01:50;
x=xx(2:5001);
vx4=zeros(1,5000);
for j=1:5000
vx4(1,j)=vph4(x(j));
end

plot(x,vx1);
plot(x,vx1,x,vx2,x,vx3,x,vx4);
legend('hx=0.01, ht=0.01','hx=0.01, ht=0.001','hx=0.005, ht=0.0001','hx=0.001, ht=0.00001') 
xlabel('k');
xlabel('k');
ylabel('Vph')
axis([0 50 0.9 1.01]);	

