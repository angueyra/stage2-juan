function StageuLCD(canvas)
    frame = 0;
    tic
    while frame < 300   
        if frame==100
            canvas.clear();
            sprintf('reached frame 100')
            toc
            
        end
        canvas.window.flip();
        frame = frame + 1;
    end
    toc
end

