%==================================================
%Pulse Shaping Using a Raised Cosine Filter
M = 16;                     % Size of signal constellation
k = log2(M);                % Number of bits per symbol
numBits = 3e5;              % Number of bits to process
numSamplesPerSymbol = 4;    % Oversampling factor


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
    fprintf('\nThe bit error rate = %5.2e, based on %d errors\n', ber, numErrors)
    BER(ii)=ber;
end
figure
semilogy(ebno,BER,'b*-')
hold on
