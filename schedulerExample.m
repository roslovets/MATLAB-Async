a = Async('Data', datetime('today'));
step = 0.5;
a.addRepeatedTask(@sleep, step, 6);
a.addTask(@alarm);
a.addTask(@sleep, step);
a.addTask(@alarm, step);
a.addTask(@wakeup, step);
a.addRepeatedTask(@work, step, 4);
a.addTask(@lunch, step);
a.addRepeatedTask(@work, step, 6);
a.addTask(@sleep, step);
a.start()

function time = sleep(~, time)
disp(datestr(time, 'HH:MM') + ": Sleep...zzzzz");
time = time + hours(1);
end

function time = alarm(~, time)
disp(datestr(time, 'HH:MM') + ": Alarm! Wake up!");
time = time + hours(1/6);
end

function time = wakeup(~, time)
disp(datestr(time, 'HH:MM') + ": Wake up, eat and dress");
time = time + hours(4/6);
end

function time = work(~, time)
disp(datestr(time, 'HH:MM') + ": Work...");
time = time + hours(1);
end

function time = lunch(~, time)
disp(datestr(time, 'HH:MM') + ": Mmmm, eat");
time = time + hours(1);
end