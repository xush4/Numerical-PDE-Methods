l=12; %5,8

xstep=2^l+2;
N=xstep-1;
xmax=1;
hx = xmax/xstep;
one_vector = 2/hx*ones(1,xstep-1);
one_vector2= 1/hx*ones(1,xstep-2);
A = diag(one_vector) - diag(one_vector2,1) - diag(one_vector2,-1);
x0=rand(N,1)*2-1;

b=zeros(N,1);
%Problem1:
%func1= @(x0) initial3_3(x0); 
%for j=1:(xstep-1)
%        tri=@(a) triangularPulse(x1(j),x(j),x(j+1),a);
%        new_fun=@(a) (tri(a) .* func1(a));
%        b(j) = integral(new_fun, (x1(j)), (x(j+1)) );
%    end


%k=40;
%x0 = zeros(n,1);
%for i=1:n
%x0(i)=sin(k*pi*i/xstep);
%end
%x0=ones(n,1)*0.95;
iter=200;
N=20;
%[final1, out1, residue_ratio1,residue1,error1] = HW5_Linear_Jacobi(A);
[out1,~,conv_ratio00,residue00,my_error00] = HW5_Linear_GaussSeidel(A,x0,b,iter*N);
conv_ratio0=conv_ratio00(1:N:iter*N);
residue0=residue00(1:N:iter*N);
my_error0=my_error00(1:N:iter*N);
%[final0, out0, residue_ratio0,residue0,error0] = HW5_Linear_Jacobi(A,1/3,x0,b);
%[final1, out1, residue_ratio1,residue1,error1] = HW5_Linear_Jacobi(A,2/3,x0,b);
conv_ratio1=zeros(iter,1);
conv_ratio2=zeros(iter,1);
residue1 = zeros(iter,1);
my_error1=zeros(iter,1);
residue2 = zeros(iter,1);
my_error2=zeros(iter,1);
%1-2_grid; 2-multigrid
x3=x0;
x2=x0;
for i=1:iter
[out2] = HW6_1_two_grid( A, x2, b);
[out3] = HW6_1_multi_grid( A, x3, b);

conv_ratio1(i)=norm(A*out2-b)/norm(A*x2-b);
conv_ratio2(i)=norm(A*out3-b)/norm(A*x3-b);
residue1(i,1)=norm(b-A*out2);
my_error1(i,1)=norm(A\b-out2);
residue2(i,1)=norm(b-A*out3);
my_error2(i,1)=norm(A\b-out3);
x2=out2;
x3=out3;
end

Niter=1:iter;

figure;
plot(Niter,conv_ratio0,'-',Niter,conv_ratio1,'-',Niter,conv_ratio2,'--');
legend('Gauss-Seidel','2-Grid','Multi-Grid');
title('Coverging Raio of Residue');

figure;
plot(Niter, residue0,'-', Niter, residue1,'-', Niter, residue2,'--');
legend('Gauss-Seidel','2-Grid','Multi-Grid');
title('Residue');
xlim([0,40])

figure;
plot(Niter, my_error0,'-', Niter, my_error1,'-', Niter, my_error2,'--');
legend('Gauss-Seidel','2-Grid','Multi-Grid');
title('Error');
xlim([0,40])