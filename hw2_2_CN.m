%Dissipation
xx=0:0.01:50;
x=xx(2:5001);
V0=@(k) 1;
vx0=V0(x);
plot(x,vx0);
xlabel('k');
ylabel('|S(k)|')
axis([0 50 0 1.1]);	

%Dispersion C-N
%fit ht
xx=0:0.01:50;
x=xx(2:5001);
a=1;
hx=0.05;
ht=0.01;
lambda=a*ht/hx/4;
vx1=zeros(1,5000);
V1=@(k) abs(log((1-2*1i*lambda*sin(k*hx))/(1+2*1i*lambda*sin(k*hx))))/k/ht;
for j=1:5000
vx1(1,j)=V1(x(j));
end

hx=0.02;
ht=0.01;
lambda=a*ht/hx/4;
V2=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx2=V2(x);

hx=0.01;
ht=0.01;
lambda=a*ht/hx/4;
V3=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx3=V3(x);

hx=0.001;
ht=0.01;
lambda=a*ht/hx/4;
V4=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx4=V4(x);

plot(x,vx1,x,vx2,x,vx3,x,vx4) 
legend('hx=0.05, ht=0.01','hx=0.02, ht=0.01','hx=0.01, ht=0.01','hx=0.001, ht=0.01') 
xlabel('K');
ylabel('Vph')
axis([0 50 0 1.1]);			

%fit hx
xx=0:0.01:50;
x=xx(2:5001);
a=1;
hx=0.01;
ht=0.05;
lambda=a*ht/hx/4;
V1=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx1=V1(x);

hx=0.01;
ht=0.02;
lambda=a*ht/hx/4;
V2=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx2=V2(x);

hx=0.01;
ht=0.01;
lambda=a*ht/hx/4;
V3=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx3=V3(x);

hx=0.01;
ht=0.001;
lambda=a*ht/hx/4;
V4=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx4=V4(x);

plot(x,vx1,x,vx2,x,vx3,x,vx4) 
legend('hx=0.01, ht=0.05','hx=0.01, ht=0.02','hx=0.01, ht=0.01','hx=0.01, ht=0.001') 
xlabel('K');
ylabel('Vph')
axis([0 50 0 1.1]);		

%Fix lambda
xx=0:0.01:50;
x=xx(2:5001);
a=1;
hx=0.05;
ht=hx;
lambda=a*ht/hx/4;
V1=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx1=V1(x);

hx=0.02;
ht=hx;
lambda=a*ht/hx/4;
V2=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx2=V2(x);

hx=0.01;
ht=hx;
lambda=a*ht/hx/4;
V3=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx3=V3(x);

hx=0.001;
ht=hx;
lambda=a*ht/hx/4;
V4=@(k) asin( (4*lambda*sin(k*hx)) ./ (1+(2*lambda*sin(k*hx)).^2) )./(k*ht);
vx4=V4(x);

plot(x,vx1,x,vx2,x,vx3,x,vx4) 
legend('hx=0.05, ht=0.05','hx=0.02, ht=0.02','hx=0.01, ht=0.01','hx=0.001, ht=0.001') 
xlabel('K');
ylabel('Vph')
axis([0 50 0 1.1]);		