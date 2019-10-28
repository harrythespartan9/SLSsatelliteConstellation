%Kate Williams
%Satellite Constellation Model
%(row,column)
N=3; %Number of satellites in constellation
At_MLT= zeros(N,N-1);%N by N-1 transposed incidence matrix for minimal length tree (MLT)

At_MLT(:,1)=1;
for i=1:N-1
    At_MLT(i,i+1)=-1;
end
At_MLT=At_MLT(1:N-1,:);

A=zeros(2*N-1,2*N-1);
A(1:N-1,N+1:N+N)=At_MLT;

I11=eye(N-1);
I22=eye(N);

A(1:N-1,1:N-1)=I11;
A(N:2*N-1,N+1:2*N)=I22;

Bt=[zeros(N-1,N) eye(N)];

B=transpose(Bt);
%assume C matirx idenity matrix
C=eye(N,2*(N-1));

%assume D matrix is zero
D=0;

%simulate
sys=ss(A,Bt,C,D);




