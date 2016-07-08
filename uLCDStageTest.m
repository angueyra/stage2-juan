% Define a window of size 640x480, non-fullscreen
window = stage.core.Window([320, 240], false);
canvas = stage.core.Canvas(window);
%%
u=squirrellab.devices.uLCDObj('COM9');
u.connect;
%%
uLCDStim=squirrellab.stimuli.uLCDStimulus();
uLCDStim.uLCD=u;

uLCDCMD = stage.builtin.controllers.PropertyController(uLCDStim, 'cmdCount', @squirrellab.stage2.uLCDCenterSurroundController);

%%

presentation = stage.core.Presentation(1);
presentation.addStimulus(uLCDStim);
% presentation.addController(spotVisible);
presentation.addController(uLCDCMD);
%
% Play the presentation on the canvas!
presentation.play(canvas);

disp(uLCDStim.cmdCount);





%%
% From single spot
rect = stage.builtin.stimuli.Rectangle();
rect.color = [1 0 1];
rect.size = [150, 75];
rect.position = [320, 240]./2;

spotVisible = stage.builtin.controllers.PropertyController(rect, 'visible', ...
    @(state)state.time >= .1 && state.time < .8 );


presentation = stage.core.Presentation(1);
presentation.addStimulus(rect);
presentation.addController(spotVisible);
%
% Play the presentation on the canvas!
presentation.play(canvas);



%%
% Create the 200x200 square stimulus at the center of the canvas
square = stage.builtin.stimuli.Rectangle();
square.position = [320, 240];
square.size = [200, 200];
% Create a controller to change the square's orientation property as a function of time.
orientationController = stage.builtin.controllers.PropertyController(square, 'orientation', ...
    @(state)state.time * 180);
% Create a 5 second presentation.
presentation = stage.core.Presentation(.5);
presentation.addStimulus(square);
presentation.addController(orientationController);
%
% Play the presentation on the canvas!
presentation.play(canvas);
%%

surround = stage.builtin.stimuli.Ellipse(4096);
surround.position = canvas.size/2;
surround.radiusX = 200;
surround.radiusY = 200;
surround.color = [130/255, 48/255, 139/255];

% Create the center stimulus.
center = stage.builtin.stimuli.Ellipse(4096);
center.position = canvas.size/2;
center.radiusX = surround.radiusX/2;
center.radiusY = surround.radiusY/2;
center.color = 1;
% Create a 5 second presentation.
presentation = stage.core.Presentation(5);
presentation.setBackgroundColor(1);
presentation.addStimulus(surround);
presentation.addStimulus(center);
%%
% Play the presentation on the canvas!
presentation.play(canvas);
fprintf('Done!\n')

%%
window = stage.core.Window([640, 480], false);
canvas = stage.core.Canvas(window);

%%
tic
presentation = stage.core.Presentation(1);
% Play the presentation on the canvas!
presentation.play(canvas);
fprintf('Done!\n')
toc

%%

%%
aperture(canvas)
%%


centerSurround(canvas)
