clc
clear all;
close all;

% no of columns
N = 6;

% create two sets of input and output matrix
S_1 = rand (N,N);
S_2 = rand (N,N);

%initialization
delta = 2.5e-4;
A_1 = delta*eye(N);
B_1 = (1/delta)*eye(N);
T_1 = A_1*B_1;

for j = 1:1:N
    A_1 = A_1 + S_2(:,j)* S_1(:,j)';
    B_1 = B_1 - (B_1*S_1(:,j)*S_1(:,j)'*B_1)/ (1+ S_1(:,j)'*B_1*S_1(:,j));
    T_recursive = A_1*B_1
end
recursive_output = T_recursive*S_1

% slower way

A_slower = zeros(N);
B_slower = zeros(N);
for m = 1:1:N
    A_slower = A_slower + S_2(:,m)* S_1(:,m)';
    B_slower = B_slower + S_1(:,m)*S_1(:,m)';    
end
T_slower  = A_slower * pinv(B_slower);
output_slower = T_slower * S_1