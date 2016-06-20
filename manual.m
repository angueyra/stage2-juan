function manual(canvas)
    import stage.core.*;
    % bla
    % Open a window in windowed-mode and create a canvas. 'disableDwm' = false for demo only!
%     window = Window([640, 480], false);
%     canvas = Canvas(window, 'disableDwm', false);

    % Create the spot stimulus.
    spot = stage.builtin.stimuli.Ellipse();
    spot.position = canvas.size/2;

    % Must init stimuli before drawing.
    spot.init(canvas);

    frame = 0;
    tic
    while frame < 300
%         
% 
%         spot.draw();
        
        
        if frame==100
            canvas.clear();
            sprintf('reached frame 100')
            toc
        end
        
        canvas.window.flip();
        frame = frame + 1;
    end
    toc
    % Window automatically closes when the window object is deleted.
end
