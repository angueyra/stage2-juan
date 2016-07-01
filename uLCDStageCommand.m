function o = uLCDStageCommand(state)
o=1;
if state.time >= 0.5 && state.time < 0.6
    fprintf('This is when i would send command\n')
    fprintf('\tFrame = %g  ',state.frame)
    fprintf('Time = %g s\n',state.time)
end

end
