function [a1,block]=add_bits(a0,msg_len)
%msg_len ÿ����Ϣ����  block ������
len=length(a0);
if rem(len,msg_len)
    block=ceil(len/msg_len);
    a1=[a0,zeros(1,block*msg_len-len)];
else
    block=len/msg_len;
    a1=a0;
end
end