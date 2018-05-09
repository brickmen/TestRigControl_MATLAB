%Loops Sweep over and over to test CNC rig

testLoops = 10;

for k=1:testLoops; 
        measurementSweep;
        fprintf('TESTLOOP: Number %i of %i \n', k, testLoops)
end
