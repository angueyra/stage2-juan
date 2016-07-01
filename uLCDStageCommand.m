function cmdCount = uLCDStageCommand(state)
uStim=state.handles{1};
u=uStim.uLCD;
cmdCount = uStim.cmdCount;
cmdFlag1 = 1;
cmdFlag2 = 1;
cmdFlag3 = 1;
if state.time < 0.5 && state.time < 0.6 && cmdFlag1
    cmdCount = cmdCount + 1;
    u.spot_white(110,110,10);
    cmdFlag1 = 0; %#ok<NASGU>
elseif state.time >= 0.5 && state.time < 0.6 && cmdFlag2
    cmdCount = cmdCount + 1;
    u.ring_white(110,110,10,25);
    fprintf('made it here, only once?\n')
    disp(cmdFlag2)
    cmdFlag2 = 0; %#ok<NASGU>
%     fprintf('This is when i would send command\n')
%     fprintf('\tFrame = %g  ',state.frame)
%     fprintf('Time = %g s\n',state.time)
elseif state.time >= 0.6 && cmdFlag3
    cmdCount = cmdCount + 1;
    u.clear;
    cmdFlag3 = 0; %#ok<NASGU>
end

uStim.cmdCount = cmdCount;
end
