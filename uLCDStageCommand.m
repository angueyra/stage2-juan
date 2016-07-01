function cmdCount = uLCDStageCommand(state)
uStim=state.handles{1};
u=uStim.uLCD;
cmdCount = uStim.cmdCount;
if state.time >= 0.5 && state.time < 0.6
    cmdCount = cmdCount +1;
%     u.ring(100,100,10,25);
%     fprintf('This is when i would send command\n')
%     fprintf('\tFrame = %g  ',state.frame)
%     fprintf('Time = %g s\n',state.time)
end
uStim.cmdCount = cmdCount;
end
