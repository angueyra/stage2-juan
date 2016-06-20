function s = uLCD_start()
s = serial('COM3','BaudRate',875000);%default=9600%max=875000 
fopen(s);
end
