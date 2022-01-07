clear
close all
snr = 26:0.5:30;
pnl = -88:3:-76;
for j=1:length(pnl)
    PNL=pnl(j);
    for i=1:length(snr)
        SNR=snr(i);
        sim('myqam');
        ser(j,i)=SER(1);
    end
end
figure(1)
title('test');

semilogy(snr,ser(1,:),'b-*')
hold on;
semilogy(snr,ser(2,:),'g-*')
semilogy(snr,ser(3,:),'r-*')
semilogy(snr,ser(4,:),'k-*')
semilogy(snr,ser(5,:),'c-*')
legend('-88dBc/Hz','-85dBc/Hz','-82dBc/Hz','-79dBc/Hz','-76dBc/Hz');
xlabel('–≈‘Î±»');
ylabel('ŒÛ¬Î¬ ');
%axis([28 30 10e-5 0.1]);
grid on

