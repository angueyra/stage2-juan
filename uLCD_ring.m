function uLCD_ring(idLCD,centerX,centerY,rInner,rOuter)
% function uLCDring(centerX,centerY,rInner,rOuter)
% Clears screen and creates white ring
centerX(centerX>220)=220/2;
centerY(centerY>220)=220/2;

% clear Screen
% fwrite(idLCD,hex2dec('FF'));
% fwrite(idLCD,hex2dec('82'));
% Outer circle
whiteCircle(idLCD,centerX,centerY,rOuter);
% redCircle(idLCD,centerX,centerY,rOuter);
%Inner circle
blackCircle(idLCD,centerX,centerY,rInner);
end

function whiteCircle(idLCD,X,Y,r)
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('77'));
fwrite(idLCD,00);fwrite(idLCD,X);
fwrite(idLCD,00);fwrite(idLCD,Y);
fwrite(idLCD,00);fwrite(idLCD,r);
fwrite(idLCD,255);fwrite(idLCD,255);
end

function blackCircle(idLCD,X,Y,r)
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('77'));
fwrite(idLCD,00);fwrite(idLCD,X);
fwrite(idLCD,00);fwrite(idLCD,Y);
fwrite(idLCD,00);fwrite(idLCD,r);
fwrite(idLCD,0);fwrite(idLCD,0);
end

function redCircle(idLCD,X,Y,r)
fwrite(idLCD,hex2dec('FF'));fwrite(idLCD,hex2dec('77'));
fwrite(idLCD,00);fwrite(idLCD,X);
fwrite(idLCD,00);fwrite(idLCD,Y);
fwrite(idLCD,00);fwrite(idLCD,r);
fwrite(idLCD,255/2);fwrite(idLCD,0/2);
end