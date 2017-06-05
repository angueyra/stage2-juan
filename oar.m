classdef oar < handle
    %OAR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        canvasSize
        rectangle
        rotationFreq = 1 % in cycles per second (Hz^-1)
        rotationController
        orientationIni = 0
        orientationCurr
    end
    
    methods
        function self = oar(canvasSize)
            self.canvasSize = canvasSize;
            self.rectangle = stage.builtin.stimuli.Rectangle();
            self.rectangle.color = [1 1 1];
            self.rectangle.position = canvasSize/2;
            self.rectangle.size = [canvasSize(1)*2 canvasSize(2)/10];
            self.rectangle.orientation = self.orientationIni;
            self.orientationCurr = self.orientationIni;
%             self.rotationController = stage.builtin.controllers.PropertyController(self.rectangle,'orientation',...
%                 @(state)(state.time-floor(state.time))* 360 * self.rotationFreq); %
            
            self.rotationController = stage.builtin.controllers.PropertyController(self.rectangle,'orientation',...
                @(state)(state.time * 360 * self.rotationFreq) + self.orientationIni); %
        end
        
        function setOrientation(self, orientation)
            
        end
    end

    
    

end

