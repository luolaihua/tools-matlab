clear;
close all;

M = 16;                     % Size of signal constellation
k = log2(M);                % Number of bits per symbol
n = 300000;                  % Number of bits to process
numSamplesPerSymbol = 4;    % Oversampling factor
rng('default')              % Use default random number generator
dataIn = randi([0 1],n,1);  % Generate vector of binary data
%===================================================
dataInMatrix = reshape(dataIn, length(dataIn)/4, 4); % Reshape data into binary 4-tuples
dataSymbolsIn = bi2de(dataInMatrix);  % Convert to integers

%Modulate using 16-QAM===================================================
dataMod = qammod(dataSymbolsIn, M);
%EbNo = 10;
ebno = 5:0.5:13;

for ii=1:length(ebno)
    EbNo=ebno(ii);
    snr = EbNo + 10*log10(k) - 10*log10(4);
    receivedSignal = awgn(dataMod, snr, 'measured');
    
%Demodulate 16-QAM===================================================
    dataSymbolsOut = qamdemod(receivedSignal, M);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    dataOut = dataOutMatrix(:);                 % Return data in column vector


%++++++++++++++++++++++++++++++++++++++
%Compute the System BER
    [numErrors, ber] = biterr(dataIn, dataOut);
    %fprintf('\nThe bit error rate = %5.2e, based on %d errors\n',ber, numErrors);
    BER(ii)=ber;
end


%==================================================
%Pulse Shaping Using a Raised Cosine Filter
M = 16;                     % Size of signal constellation
k = log2(M);                % Number of bits per symbol
numBits = 3e5;              % Number of bits to process
numSamplesPerSymbol = 4;    % Oversampling factor
span = 10;        % Filter span in symbols
rolloff = 0.25;   % Roloff factor of filter
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol);
%fvtool(rrcFilter,'Analysis','Impulse')

rng('default')                      % Use default random number generator
dataIn = randi([0 1], numBits, 1);  % Generate vector of binary data
dataInMatrix = reshape(dataIn, length(dataIn)/k, k); % Reshape data into binary 4-tuples
dataSymbolsIn = bi2de(dataInMatrix);                 % Convert to integers
dataMod = qammod(dataSymbolsIn, M);
txSignal = upfirdn(dataMod, rrcFilter, numSamplesPerSymbol, 1);
ebno = 5:0.5:13;

for ii=1:length(ebno)
    EbNo=ebno(ii);
    snr = EbNo + 10*log10(k) - 10*log10(numSamplesPerSymbol);
    rxSignal = awgn(txSignal, snr, 'measured');
    rxFiltSignal = upfirdn(rxSignal,rrcFilter,1,numSamplesPerSymbol);   % Downsample and filter
    rxFiltSignal = rxFiltSignal(span+1:end-span);      
    dataSymbolsOut = qamdemod(rxFiltSignal, M);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    dataOut = dataOutMatrix(:);   
    [numErrors, ber] = biterr(dataIn, dataOut);
   % fprintf('\nThe bit error rate = %5.2e, based on %d errors\n', ber, numErrors);
    BER_rcf(ii)=ber;
end


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


M = 16;                                         % Size of signal constellation
k = log2(M);                                    % Number of bits per symbol
numBits = 100000;                               % Number of bits to process
numSamplesPerSymbol = 4;   
rng default                                     % Use default random number generator
dataIn = randi([0 1], numBits, 1);   
tPoly = poly2trellis([5 4],[23 35 0; 0 5 13]);
codeRate = 2/3;
dataEnc = convenc(dataIn, tPoly);
dataEncMatrix = reshape(dataEnc,length(dataEnc)/k, k);                      % Reshape data into binary 4-tuples
dataSymbolsIn = bi2de(dataEncMatrix);    
dataMod = qammod(dataSymbolsIn, M);
span = 10;        % Filter span in symbols
rolloff = 0.25;   % Roloff factor of filter
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol);
txSignal = upfirdn(dataMod, rrcFilter, numSamplesPerSymbol, 1);
ebno = 5:0.5:13;
for ii=1:length(ebno)
    EbNo=ebno(ii);
    snr = EbNo + 10*log10(k*codeRate)-10*log10(numSamplesPerSymbol);
    rxSignal = awgn(txSignal, snr, 'measured');
    rxFiltSignal = upfirdn(rxSignal,rrcFilter,1,numSamplesPerSymbol);   % Downsample and filter
    rxFiltSignal = rxFiltSignal(span+1:end-span);    
    dataSymbolsOut = qamdemod(rxFiltSignal, M);
    dataOutMatrix = de2bi(dataSymbolsOut,k);
    codedDataOut = dataOutMatrix(:);          
    traceBack = 16;                                             % Traceback length for decoding
    numCodeWords = floor(length(codedDataOut)*2/3);             % Number of complete codewords
    dataOut = vitdec(codedDataOut(1:numCodeWords*3/2),tPoly,traceBack,'cont','hard');
    decDelay = 2*traceBack;                                     % Decoder delay, in bits
    [numErrors, ber] = biterr(dataIn(1:end-decDelay),dataOut(decDelay+1:end));
    %fprintf('\nThe bit error rate = %5.2e, based on %d errors\n',ber, numErrors);
    
    BER_add(ii)=ber;
end

figure
semilogy(ebno,BER,'b*-')
hold on;
semilogy(ebno,BER_rcf,'r*-')
semilogy(ebno,BER_add,'k*-')
title('16-QAM在AWGN信道下的性能')
xlabel('信噪比Eb/No(dB)')
ylabel('误符号率')
legend('无滤波器','加入升余弦滤波','加入升余弦和卷积编码')
grid on
hold off








