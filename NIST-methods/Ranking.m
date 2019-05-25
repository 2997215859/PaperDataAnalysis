function [ P,judge ] = Ranking( input,m )
%  ��Ԫ�����ȼ��飬�����ȼ��
%  ���������еķ����Ӿ�����ȡ�Ŀ���Ǻ˶�Դ�����й̶����������������������ϵ��
%  M=32��Q=32,n>=MQ=1024,  q=m,n>=38mq

    n = length(input);
    if n >=1024
        M = 32;
        Q = 32;
    else
        M = m;
        Q = m;
    end
    N = floor(n/(M*Q));
    F = zeros(1,3);
    for i = 1:N
        data = zeros(M,Q);
        for j = 1:M
            data(j,:) = input((i-1)*M*Q+(j-1)*Q+1:(i-1)*M*Q+(j-1)*Q+Q);
        end
        r(i) = rank(data);
        if r(i) == M
            F(1) = F(1)+1;
        else if r(i) == M-1
                F(2) = F(2)+1;
            else
                F(3) = F(3)+1;
            end
        end
    end
    
    pai = [0.2888,0.5776,0.1336];
    V = sum((F-N*pai).^2./(N*pai));
    P = exp(-V/2);
%     P = 1-gammainc(V/2,1);
    if P > 0.01
        judge = 'YES';
    else
        judge = 'NO';
    end
    
end

