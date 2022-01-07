M = 16;                                         % Size of signal constellation
k = log2(M);                                    % Number of bits per symbol
numBits = 100000;                               % Number of bits to process
numSamplesPerSymbol = 4;                        % Oversampling factor
rng('default')                                  % Use default random number generator
dataIn = randi([0 1], numBits, 1);              % Generate vector of binary data
tPoly = poly2trellis([5 4],[23 35 0; 0 5 13]);
codeRate = 2/3;
dataEnc = convenc(dataIn, tPoly);
dataEncMatrix = reshape(dataEnc,length(dataEnc)/k, k);                      % Reshape data into binary 4-tuples
dataSymbolsIn = bi2de(dataEncMatrix);           % Convert to integers
span = 10;        % Filter span in symbols
rolloff = 0.25;   % Roloff factor of filter
rrcFilter = rcosdesign(rolloff, span, numSamplesPerSymbol);
txSignal = upfirdn(dataMod, rrcFilter, numSamplesPerSymbol, 1);
EbNo = 10;
snr = EbNo + 10*log10(k*codeRate)-10*log10(numSamplesPerSymbol);
rxSignal = awgn(txSignal, snr, 'measured');
rxFiltSignal = upfirdn(rxSignal,rrcFilter,1,numSamplesPerSymbol);   % Downsample and filter
rxFiltSignal = rxFiltSignal(span+1:end-span);     
dataSymbolsOut = qamdemod(rxFiltSignal, M);
dataOutMatrix = de2bi(dataSymbolsOut,k);
codedDataOut = dataOutMatrix(:);                 % Return data in column vector
traceBack = 16;                                             % Traceback length for decoding
numCodeWords = floor(length(codedDataOut)*2/3);             % Number of complete codewords
dataOut = vitdec(codedDataOut(1:numCodeWords*3/2),tPoly,traceBack,'cont','hard');
decDelay = 2*traceBack;                                     % Decoder delay, in bits
[numErrors, ber] =biterr(dataIn(1:end-decDelay),dataOut(decDelay+1:end));

fprintf('\nThe bit error rate = %5.2e, based on %d errors\n',ber, numErrors)







