%% === �ӳ���һ �������� ======
%% === T_ring.m  (ע��ʹ��ԭʼ�ļ���) ======
function [  ] = T_ring( obj, event , T_event )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
     
    %% === save the content of cell - T_event ===== 
      msg = T_event{1,1} ;
      
%       disp(msg) ;  % === test code ========
      
      msgbox(msg, '����һ����������') ;
      
    %% === ����matlab �Դ���������������������������������� ===
      for i = 1:5
          load splat ;
          sound(y, Fs) ;
      end

end
