%% === 子文件 计时程序（注：这不是一个函数文件） ===
%% === calc_time.m  (注意使用原始文件名) ======
%% === create a figure ==========
   h1 = figure( 'MenuBar' , 'none' ,...
       'Color' , 'white' ,...
       'NumberTitle' , 'off' ,...
       'units','normalized' , 'position', [0.05 0.1 0.9 0.8], ...
       'Name' , 'Calc_time' ) ;
   
%% === 
    h1_text = uicontrol('parent', h1, ...   
       'BackgroundColor', [1 1 1], ...
       'fontname' , 'Verdana' ,...
       'fontsize' , 180 ,...
       'style', 'text', ...
       'horizontal', 'center', ...
       'units','normalized' , 'position', [0.05 0.35 0.9 0.45], ...
       'string', '0:0:0' );
   
%% ===
    h1_button_start = uicontrol('parent', h1, ...   
       'BackgroundColor', [1 1 1], ...
       'fontname' , 'Verdana' ,...
       'fontsize' , 10 ,...
       'style', 'pushbutton', ...
       'horizontal', 'center', ...
        'units','normalized' , 'position', [0 0 0.05 0.05], ...
       'callback' , [' k=0 ;'] ,...
       'string', 'start' );
   
%% ===
    h1_button_stop = uicontrol('parent', h1, ...   
       'BackgroundColor', [1 1 1], ...
       'fontname' , 'Verdana' ,...
       'fontsize' , 10 ,...
       'horizontal', 'center', ...
        'units','normalized' , 'position', [0.05 0 0.05 0.05], ...
       'callback' , [...
       ' k=1 ; , '] ,...
       'string', 'stop' ) ;
   
%% ===
    h1_button_reset = uicontrol('parent', h1, ...   
       'BackgroundColor', [1 1 1], ...
       'fontname' , 'Verdana' ,...
       'fontsize' , 10 ,...
       'horizontal', 'center', ...
        'units','normalized' , 'position', [0.1 0 0.05 0.05], ...
       'callback' , [...
       ' k=2 ; , '] ,...
       'string', 'reset' ) ;
   
%% ===
   k = 2 ;   %年月日时分秒 123456

   while ishandle(h1)
      
       if ( 0 == k )
           t_that = clock ;
           
           while ishandle(h1)
               
               t_this = clock ;
               
           % == 
               if ( t_this(6) >= t_that(6) )
                   t_second = t_this(6) - t_that(6) ;
               else
                   if ( t_this(5) > t_that(5) )
                       t_this(5) = t_this(5) - 1 ;
                       t_second = t_this(6) + 60 - t_that(6) ;
                   else
                       t_this(4) = t_this(4) - 1 ;
                       t_this(5) = t_this(5) + 59 ;
                       t_second = t_this(6) + 60 - t_that(6) ;
                   end
               end
               
           % ==
               if ( t_this(5) >= t_that(5) )
                   t_minute = t_this(5) - t_that(5) ;
               else
                   t_this(4) = t_this(4) - 1 ;
                   t_minute = t_this(5) + 60 - t_that(5) ;
               end
               
           % ==
               t_hour = t_this(4) - t_that(4) ; 
               t_second1=fix(t_second);
               if t_second1==10
                   disp(666666);
               end
           % ==
              set( h1_text , 'String' , [num2str(t_hour) ' : ' num2str(t_minute) ' : ' num2str(t_second1)] ) ;

               pause( 0.1 ) ;   % === ! important pause in inside while =======
               
           % == 
               if ( k == 1 )
                   break ;
               end
               
                if ( k == 2 )
                   set( h1_text , 'String' , '0:0:0' ) ;
                   break ;
               end
               
            
           end    %=== close inside while ==========

       end 
       
       if ( k == 2 )
           set( h1_text , 'String' , '0:0:0' ) ;
       end
    
       pause( 0.1 ) ;    % === ! important pause in outside while ===========
       
   end   %=== close outside while ==========
