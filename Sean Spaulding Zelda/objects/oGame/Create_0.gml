/// @description Initialize Game & Global Variables
// You can write your code in this editor
randomize();

global.gamePaused = false;
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = 120;
global.targetY = 120;
global.targetDirection = 0;

global.iCamera = instance_create_layer(0,0,layer,oCamera);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);
