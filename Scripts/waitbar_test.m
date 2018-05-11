% Test Script for the WaitBar
loops = 1003;
wait = 0.1; %seconds
ux_wb_msg = [ 'Measurement In Progress '];
ux_wb = waitbar(0,ux_wb_msg );
tic
for i = 1:1:loops
    pause(wait)
    ratioComplete = i/loops;
    ux_wb_progress = ratioComplete;
    waitbar(ux_wb_progress,ux_wb);
end
toc
close(ux_wb)