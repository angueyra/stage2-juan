%% Trying to create swimming-inducing stimuli
% connect
client = stage.core.network.StageClient();

client.connect()
canvasSize = client.getCanvasSize;

%% send to separate instance
p = stage.core.Presentation(10);
r=oar(canvasSize);
r.rotationFreq=1/5;
p.addStimulus(r.rectangle);
p.addController(r.rotationController);
player = stage.builtin.players.RealtimePlayer(p);
client.play(player);

%% using just one instance
import stage.core.*
window = Window([342, 192], false);
canvas = Canvas(window, 'disableDwm', false);
canvasSize = canvas.size;
%%
p = stage.core.Presentation(5);
r=oar(canvasSize);
r.rotationFreq=1/5;
r.orientation = 90;
p.addStimulus(r.rectangle);
p.addController(r.rotationController);
p.play(canvas);

%%
p = stage.core.Presentation(2);
r=stage.builtin.stimuli.Ellipse();
r.color = [0 0 0];
% r.position = client.getCanvasSize/2; %center 
r.position = [0 canvasSize(2)/2];
r.radiusX = min(canvasSize)/10;
r.radiusY = r.radiusX;
rc_color = stage.builtin.controllers.PropertyController(r,'color',@(state)[repmat(state.time/5,1,2),1]);
rc_position = stage.builtin.controllers.PropertyController(r,'position',@(state)([state.time*canvasSize(1),r.position(2)]));
p.addStimulus(r);
p.addController(rc_color);
p.addController(rc_position);
player = stage.builtin.players.RealtimePlayer(p);
client.play(player);

%%
r=stage.builtin.stimuli.Rectangle();
r.size = [canvasSize(1), canvasSize(2)/10];
r.position = canvasSize/2;
r.orientation = 450;

p = stage.core.Presentation(.1);
p.addStimulus(r);
p.play(canvas);
