%% === �ӳ���һ ���ӳ��� ======
%% === timing.m  (ע��ʹ��ԭʼ�ļ���) ======
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
     str = ['����' num2str(time_set(1)) '/' answer{1} '/' answer{2} '  ' answer{3} ':' answer{4} '������һ�����ӣ�����Ϊ��' answer{5}] ;
     
%      disp(str) ;  % === test code =======
     
     msgbox(str, 'attention') ;

    %% === create a timer =============
      h_timing = timer('Name' , 'H_timing' ,...
          'TimerFcn' , {@T_ring , T_event},...  %=������ T_ring.m,������
          'ExecutionMode' , 'singleShot' );
      
    %% === start the timer =============
      startat(h_timing, time_set) ;

end
