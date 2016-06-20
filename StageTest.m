% Define a window of size 640x480, non-fullscreen
window = stage.core.Window([640, 480], false);
canvas = stage.core.Canvas(window);
%%
% Create the 200x200 square stimulus at the center of the canvas
square = stage.builtin.stimuli.Rectangle();
square.position = [320, 240];
square.size = [200, 200];
%%
% Create a controller to change the square's orientation property as a function of time.
orientationController = stage.builtin.controllers.PropertyController(square, 'orientation', ...
    @(state)state.time * 180);
%%
% Create a 5 second presentation.
presentation = stage.core.Presentation(5);
presentation.addStimulus(square);
presentation.addController(orientationController);
%%
% Play the presentation on the canvas!
presentation.play(canvas);
%%

aperture(canvas)
%%


centerSurround(canvas)
