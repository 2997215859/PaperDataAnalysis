function bob0=gen_key(alice0,snr)
modbit1 = pskmod(alice0,2); %���Ƽ��ص���
modbit2= awgn(modbit1,snr,'measured');%bob���յ��ź�
bob0=pskdemod(modbit2,2);
end