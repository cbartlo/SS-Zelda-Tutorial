/// @description Initialize Game & Global Variables
// You can write your code in this editor
randomize();

global.gamePaused = false;
global.iCamera = instance_create_layer(0,0,layer,oCamera);


room_goto(ROOM_START);
