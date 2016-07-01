% A stage stimulus that contains the uLCD device

classdef uLCDStimulus < stage.core.Stimulus

    properties
        uLCD
        cmdCount = 0;
    end

    properties (Access = private)

    end

    methods

    end

    methods (Access = protected)
        function performDraw(obj)
            modelView = obj.canvas.modelView;
            modelView.push();
            modelView.pop();
        end
    end

end

