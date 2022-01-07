%% === 子程序一 闹钟程序 ======
%% === timing.m  (注意使用原始文件名) ======
function [  ] = timing( obj, event )
    
    %% === save the current time ========
      ti = clock ;
      
    %% === create a input dialog =========
      prompt = {'mouth' , 'day' , 'hour' , 'minute' , 'event'} ;
      title = 'input your timing clock time' ;
      
      answer = inputdlg(prompt, title) ;
      
%       disp(answer);      %=== test code =========
      
    %% === get the time form client =======
      time_set = clock ;
      time_set(2) = str2num( answer{1} ) ;
      time_set(3) = str2num( answer{2} ) ;
      time_set(4) = str2num( answer{3} ) ;
      time_set(5) = str2num( answer{4} ) ;
      time_set(6) = 0 ;
      
      T_event{1,1} = answer{5} ;
      
%       disp(time_set) ;  %=== test code ========
    
    %% === show your set time =========
     str = ['你在' num2str(time_set(1)) '/' answer{1} '/' answer{2} '  ' answer{3} ':' answer{4} '设置了一个闹钟，内容为：' answer{5}] ;
     
%      disp(str) ;  % === test code =======
     
     msgbox(str, 'attention') ;

    %% === create a timer =============
      h_timing = timer('Name' , 'H_timing' ,...
          'TimerFcn' , {@T_ring , T_event},...  %=调用了 T_ring.m,并传参
          'ExecutionMode' , 'singleShot' );
      
    %% === start the timer =============
      startat(h_timing, time_set) ;

end
