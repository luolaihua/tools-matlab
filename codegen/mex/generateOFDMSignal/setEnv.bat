set COMPILER=$MINGWROOT\bin\gcc
                set CXXCOMPILER=$MINGWROOT\bin\g++
                set COMPFLAGS=-c -fexceptions -fno-omit-frame-pointer -DTARGET_API_VERSION=700   -m64 -DMATLAB_MEX_FILE  -DMATLAB_MEX_FILE 
                set CXXCOMPFLAGS=-c -fexceptions -fno-omit-frame-pointer -std=c++11 -DTARGET_API_VERSION=700   -m64 -DMATLAB_MEX_FILE  -DMATLAB_MEX_FILE 
                set OPTIMFLAGS=-O -DNDEBUG
                set DEBUGFLAGS=-g
                set LINKER=$MINGWROOT\bin\gcc
                set CXXLINKER=$MINGWROOT\bin\g++
                set LINKFLAGS=-m64 -Wl,--no-undefined -shared -L"C:\Program Files\MATLAB\R2017a\extern\lib\win64\mingw64" -llibmx -llibmex -llibmat -lm -llibmwlapack -llibmwblas 
                set LINKDEBUGFLAGS=-g
                set NAME_OUTPUT=-o "%OUTDIR%%MEX_NAME%%MEX_EXT%"
set PATH=$MINGWROOT\bin;C:\Program Files\MATLAB\R2017a\extern\include\win64;C:\Program Files\MATLAB\R2017a\extern\include;C:\Program Files\MATLAB\R2017a\simulink\include;C:\Program Files\MATLAB\R2017a\lib\win64;%MATLAB_BIN%;%PATH%
set INCLUDE=$MINGWROOT\include;;%INCLUDE%
set LIB=$MINGWROOT\lib;;%LIB%
set LIBPATH=C:\Program Files\MATLAB\R2017a\extern\lib\win64;%LIBPATH%
