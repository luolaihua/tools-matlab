%������

nowt = num2cell(fix(clock));
addt = cell(1,6);
addt = {0,0,0,0,0,0 };
addt{1,6} = input('\n\n count down from____sec\n\n'); %% ͨ��input����Ҫ�����������������Ե���
a = cell2mat(nowt);
b = cell2mat(addt);
count = a + b; %% �����count������������ĵ�������double��ʽ


global Endtime
Endtime=[count];
t = timer('StartDelay', 0,'Period',0.05,'TasksToExecute', 10000,...
          'ExecutionMode','fixedRate');
t.TimerFcn = {@mycallback}; %% ����function �Ӻ���
start(t)