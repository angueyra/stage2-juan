classdef oar < handle
    %OAR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        canvasSize
        rectangle = stage.builtin.stimuli.Rectangle();
        rotationFreq = 1 % in cycles per second (Hz^-1)
        rotationController
        orientation = 0
    end
    
    properties (Dependent)
        dps % degrees per second for rotation
    end
    
    methods
        function self = oar(canvasSize)
            self.canvasSize = canvasSize;
            self.rectangle.color = [1 1 1];
            self.rectangle.position = canvasSize/2;
            self.rectangle.size = [canvasSize(1)*2 canvasSize(2)/10];
            self.rectangle.orientation = self.orientation;
            
            self.rotationController = stage.builtin.controllers.PropertyController(self.rectangle,'orientation',...
                @(state)(state.time * self.dps) + self.orientation); %
        end
        
        function dps = get.dps(self)
            dps = 360 * self.rotationFreq;
        end
        
    end

    
    

end

