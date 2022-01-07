clear;
close all;

M = 16;                     % Size of signal constellation
k = log2(M); 
numBits=3e5;
% Number of bits per symbol
n = 300000;                  % Number of bits to process
numSamplesPerSymbol = 4;    % Oversampling factor
rng('default')              % Use default random number generator
dataIn = randi([0 1],numBits,1);  % Generate vector of binary data
dataInMatrix = reshape(dataIn, length(dataIn)/k, k); % Reshape data into binary 4-tuples
dataSymbolsIn = bi2de(dataInMatrix);  % Convert to integers
%Modulate using 16-QAM===================================================
dataMod = qammod(dataSymbolsIn, M);
%EbNo = 10;
ebno = 5:0.5:13;

for ii=1:length(ebno)
    EbNo=ebno(ii);
    snr = EbNo + 10*log10(k) - 10*log10(numSamplesPerSymbol);
    receivedSignal = awgn(dataMod, snr, 'measured');
    dataSymbolsOut = qamdemod(receivedSignal, M);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    dataOut = dataOutMatrix(:);                 % Return data in column vector


%++++++++++++++++++++++++++++++++++++++
%Compute the System BER
    [numErrors, ber] = biterr(dataIn, dataOut);
    fprintf('\nThe bit error rate = %5.2e, based on %d errors\n',ber, numErrors)
    BER(ii)=ber;
end

figure
semilogy(ebno,BER,'b*-')
hold on;
title('16-QAM在AWGN信道下的性能')
xlabel('信噪比Eb/No(dB)')
ylabel('误符号率')
hold off