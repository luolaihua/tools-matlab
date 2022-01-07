%% === 子程序一 铃声程序 ======
%% === T_ring.m  (注意使用原始文件名) ======
function [  ] = T_ring( obj, event , T_event )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
     
    %% === save the content of cell - T_event ===== 
      msg = T_event{1,1} ;
      
%       disp(msg) ;  % === test code ========
      
      msgbox(msg, '你有一个闹铃提醒') ;
      
    %% === 这是matlab 自带的铃声，其他的铃声程序可以在网上找 ===
      for i = 1:5
          load splat ;
          sound(y, Fs) ;
      end

end
