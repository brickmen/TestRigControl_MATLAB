% Configuration setup for the Scope
t = tcpip('192.168.1.2',4000);
fopen(t)
pause(1);
flushinput(t);