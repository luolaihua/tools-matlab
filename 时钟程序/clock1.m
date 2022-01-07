%% === 主程序 时钟程序 ======
% 
%  PREFORMATTED
% 
%  PREFORMATTED
%  TEXT
% 
%  TEXT
% 
%% === clock1.m  (注意使用原始文件名) ======
function [ ] = clock1( )

 try 
   close all
   
%% === create the figure  ============
   h0 = figure( 'MenuBar' , 'none' ,...
       'Color' , 'white' ,...
       'NumberTitle' , 'off' ,...
       'Name' , 'Clock' ) ;
  
%% === 背景程序，不用可以删 ==========   
%  ha=axes('units','normalized','position',[0 0 1 1]) ;  
%  uistack(ha,'down')
%  II=imread('3.jpg') ;      %=== 3.jpg 是图片地址====
%  image(II)
%  colormap gray
%  set(ha,'handlevisibility','off','visible','off') ;
   
%% === create a menu to set the timing clock =====
   regular_t = uimenu('Parent' , h0 ,...
       'Label' , '闹钟' ,...
       'Callback' , @timing) ;    %=== 调用了 timing.m ====
   
%% === create a menu to calculate the time =====
   cal_t = uimenu('Parent' , h0 ,...
       'Label' , '计时' ,...
       'Callback' , ['run calc_time ;' ]) ;  %=== 运行了 calc_time.m 文件
   
%% =================
   theta = linspace(0 , 6.288 , 1000) ;   % 6.28 近似等于 2*pi
  
   x1 = 8*cos(theta) ;
   y1 = 8*sin(theta) ;
   
   plot(x1 , y1 , 'color' , [0.5 0.5 0.5] , 'linewidth' , 16)   %===时钟的外层   
   hold on
   axis equal
   
   fill(x1 , y1 , [0.7 0.7 0.7]) ;  %=== 时钟的内层
   
   text( 0 , 5 , 'the big bag' , 'fontsize' , 16  , 'color' , [0.8 0.8 0.8] , 'HorizontalAlignment' , 'center') ;  % the name of the clock
   
   lighting phong
   material metal
   
   axis off
   
   axis([-10 10 -10 10])
   set(gca , 'position' , [0.1 0.1 0.775 0.815]) ; 
   
%% ===========================
   t_title = floor(clock) ;
   
   title([num2str(t_title(1)) '年' num2str(t_title(2)) '月' num2str(t_title(3)) '日'] , 'fontname' , 'Verdana' , 'fontsize' , 13 , 'color' , [0.2 0.2 0.2]) ;
   
   %% === 创建一个edit控件去显示数字时间 =========
   h0_edit = uicontrol('parent', h0, ...   % a edit to show the hour, minute, second dymaically
       'enable', 'inactive', ...
       'BackgroundColor', [1 0.8 0.4], ...
       'fontname' , 'Verdana' ,...
       'fontsize' , 12 ,...
       'style', 'edit', ...
       'horizontal', 'center', ...
       'units','normalized' , 'position', [0.38 0.04 0.22 0.08], ...
       'string', [num2str(t_title(4)) ' : ' num2str(t_title(5)) ' : ' num2str(t_title(6))]);
   
   for k=1:12
       
       xk=8.8*cos( -2*pi / 12*k + pi/2);
       yk=8.8*sin(-2*pi / 12*k + pi/2);

       plot([xk/9*8 xk/9*7],[yk/9*8 yk/9*7] , 'color'  , [0.8 0.8 0.8] , 'linewidth' , 3) ;
       
  %     text(xk , yk , num2str(k) , 'fontsize' , 16 , 'color' , [0.9 0.3 0.8] , 'HorizontalAlignment' , 'center') ; %  mark of clock
   end
   
   %% ==========================
      ti=clock;   % get the current time
    
   %% === 时针初始位置 ===========
      th_out = -(ti(4) + ti(5)/60 + ti(6)/3600)/12*2*pi+pi/2 ;   % the angle of clock is different from the axes, so pi/2 is needed to correct. 
     
      th_in = th_out - pi;

      hh = plot([1.5*cos(th_in)  5*cos(th_out)] , [1.5*sin(th_in)  5*sin(th_out)] , 'color' , [0.8 0.8 0.8] , 'linewidth' , 9) ;
   
   %% === 分针初始位置 ===========
      tm_out = -(ti(5) + ti(6)/60)/60*2*pi + pi/2 ;
      
      tm_in = tm_out - pi;

     hm = plot([2*cos(tm_in)  6*cos(tm_out)] , [2*sin(tm_in)  6*sin(tm_out)] , 'color' , [0.8 0.8 0.8] , 'linewidth' , 7) ;
   
   %% === 秒针初始位置 ============
     ts_out = -(ti(6)/60*2*pi + pi/2) ;
   
     ts_in = ts_out - pi;
 
     hs = plot([3*cos(ts_in)  7*cos(ts_out)] , [3*sin(ts_in)  7*sin(ts_out)] , 'color' , [0.8 0.8 0.8] , 'linewidth' , 4) ;
     
     fill([0.2*cos(theta)] , [0.2*sin(theta)] , 'w') ;  % the center crew of the clock
 
     set(gcf , 'doublebuffer' , 'on') ;
     
     flag = 3 ; % === 
   
   while ishandle(h0);      %=== 请不要使用 1 来无限循环
      
       ti = floor(clock) ; % get the current time from loop
       
       str =  [num2str(ti(4)) ' : ' num2str(ti(5)) ' : ' num2str(ti(6))] ;
       
       set(h0_edit, 'String', str) ; % use the edit to show the current time
    
    %% === calculate the next position of pointer of hour =====
      th_out = -(ti(4) + ti(5)/60 + ti(6)/3600)/12*2*pi+pi/2 ;
    
      th_in = th_out - pi;
     
      set(hh , 'XData' , [1.5*cos(th_in)  5*cos(th_out)] , 'YData' , [1.5*sin(th_in)  5*sin(th_out)]) 
      
    %% === calculate the next position of pointer of minute =====
      tm_out = -(ti(5) + ti(6)/60)/60*2*pi + pi/2 ;
         
      tm_in = tm_out - pi;
     
      set(hm , 'XData' , [2*cos(tm_in)  6*cos(tm_out)] , 'YData' , [2*sin(tm_in)  6*sin(tm_out)]) 
      
    %% === calculate the next position of pointer of second =======
      ts_out = -(ti(6)/60)*2*pi + pi/2 ;
   
      ts_in = ts_out - pi;
      
      set(hs, 'XData' , [3*cos(ts_in)  7*cos(ts_out)] , 'YData' , [3*sin(ts_in)  7*sin(ts_out)]) 
     
%       light('position' , [-10,15,0] , 'style' , 'local' , 'color', [0.8,0.3,0.3]) 

      drawnow ;
      
%       pause(0.09) ;
   end
   
   
 catch
     'error:please mail to 1917066897@qq.com ';
     return
 end

end
