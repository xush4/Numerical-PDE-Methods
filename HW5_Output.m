% xstep=5;  %Jacobi: 0.8090
% xstep=10; %Jacobi: 0.9511
% xstep=20; %Jacobi: 0.9876
xstep=64;
xmax=1;
hx = xmax/xstep;
one_vector = 2/hx*ones(1,xstep-1);
one_vector2= 1/hx*ones(1,xstep-2);
A = diag(one_vector) - diag(one_vector2,1) - diag(one_vector2,-1);
x0=rand(n,1)*2-1;

[m,n]=size(A);
b=zeros(n,1);
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

%[final1, out1, residue_ratio1,residue1,error1] = HW5_Linear_Jacobi(A);
%[final2, out2, residue_ratio2,residue2,error2] = HW5_Linear_GaussSeidel(A);
%[final0, out0, residue_ratio0,residue0,error0] = HW5_Linear_Jacobi(A,1/3,x0,b);
%[final1, out1, residue_ratio1,residue1,error1] = HW5_Linear_Jacobi(A,2/3,x0,b);
[out2,final2, residue_ratio2,residue2,error2] = HW5_Linear_GaussSeidel(A,x0,b);
%[final3, out3, residue_ratio3,residue3,error3] = HW5_Linear_Jacobi(A,1/2,x0,b);
%[ final11, out11, err11] = HW5_Linear_Jacobi(A,2/3,x0);
%[ final21, out21, err21] = HW5_Linear_GaussSeidel(A,x0);
%N=1:length(residue_ratio1);

%figure;
%plot(N,residue_ratio0,'-',N,residue_ratio3,'-',N,residue_ratio1,'-',N,residue_ratio2,'-');
%legend('Weighted Jacobi-1/3','Weighted Jacobi-1/2','Weighted Jacobi-2/3','Gauss Seidel');
%title('Coverging Raio of Residue');

%figure;
%plot(N, residue0,'-',N, residue3,'-',N, residue1,'-', N, residue2,'-');
%legend('Weighted Jacobi-1/3','Weighted Jacobi-1/2','Weighted Jacobi-2/3','Gauss Seidel');
%title('Residue');

%figure;
%plot(N, error0,'-',N, error3,'-', N, error1,'-', N, error2,'-');
%legend('Weighted Jacobi-1/3','Weighted Jacobi-1/2','Weighted Jacobi-2/3','Gauss Seidel');
%title('Error');