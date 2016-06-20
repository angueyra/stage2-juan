s = serial('COM3','BaudRate',875000);%default=9600%max=875000 
fopen(s);
%%
s = serial('COM4','BaudRate',56000);%default=9600%max=875000 
fopen(s);
%% clear screen
fwrite(s,hex2dec('FF'));
fwrite(s,hex2dec('82'));
uLCD_clear(s);
uLCD_ring(s,116,122,1,2);
beep; beep;
%%
uLCD_clear(s);
uLCD_spot(s,110,118,4);
beep; beep;
%%
uLCD_clear(s);
uLCD_ring(s,110,118,0,1000);
beep; beep;