client = stage.core.network.StageClient();

client.connect()
%%
p = stage.core.Presentation(5);
r=stage.builtin.stimuli.Ellipse();
r.color = [1 0 0];
r.position = [0 200];
rc_color = stage.builtin.controllers.PropertyController(r,'color',@(s)[repmat(s.time/5,1,2),1]);
rc_position = stage.builtin.controllers.PropertyController(r,'position',@(s)([s.time*220+100,400]));
p.addStimulus(r);
p.addController(rc_color);
p.addController(rc_position);
player = stage.builtin.players.RealtimePlayer(p);
client.play(player);

%%
import stage.core.*
checkerboardMatrix = uint8(rand(10, 10) * 255);

% Create the checkerboard stimulus.
checkerboard = stage.builtin.stimuli.Image(checkerboardMatrix);
checkerboard.position = 1200 / 2;
checkerboard.size = [200, 200];

% Set the minifying and magnifying functions to form discrete stixels.
checkerboard.setMinFunction(GL.NEAREST);
checkerboard.setMagFunction(GL.NEAREST);

% Create a controller to change the checkerboard image matrix every frame.
checkerboardImageController = stage.builtin.controllers.PropertyController(checkerboard, 'imageMatrix', @(s)uint8(rand(10, 10) * 255));

% Create a 3 second presentation and add the stimulus and controller.
presentation = Presentation(3);
presentation.addStimulus(checkerboard);
presentation.addController(checkerboardImageController);

player = stage.builtin.players.RealtimePlayer(presentation);
client.play(player);

%%
r=stage.builtin.stimuli.Rectangle()
