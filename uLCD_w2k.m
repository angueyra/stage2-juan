function uLCD_w2k(idLCD)
% function uLCD_w2k(idLCD)
% makes all white pixels black
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('69'));
fwrite(idLCD,255);fwrite(idLCD,255);
fwrite(idLCD,0);fwrite(idLCD,0);
end
