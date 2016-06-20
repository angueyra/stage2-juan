function uLCD_clear(idLCD)
%function uLCD_clear(idLCD)
% clear Screen
fwrite(idLCD,hex2dec('FF'));
fwrite(idLCD,hex2dec('82'));
end
