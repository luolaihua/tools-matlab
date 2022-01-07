%主程序

nowt = num2cell(fix(clock));
addt = cell(1,6);
addt = {0,0,0,0,0,0 };
addt{1,6} = input('\n\n count down from____sec\n\n'); %% 通过input你想要倒数的秒数，即可以倒数
a = cell2mat(nowt);
b = cell2mat(addt);
count = a + b; %% 这里的count最后会用于下面的倒数，是double格式


global Endtime
Endtime=[count];
t = timer('StartDelay', 0,'Period',0.05,'TasksToExecute', 10000,...
          'ExecutionMode','fixedRate');
t.TimerFcn = {@mycallback}; %% 引入function 子函数
start(t)