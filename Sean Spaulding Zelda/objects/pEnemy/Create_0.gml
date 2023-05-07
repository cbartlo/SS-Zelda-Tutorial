/// @description Insert description here
// You can write your code in this editor
// pull in everything from pEntity
event_inherited();

state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
//This is to do a check every few frames
aggroCheck = 0;
aggroCheckDuration = 5;

//things to track timing on the enemies
timePassed = 0;
waitDuration = 60;
wait = 0;
//Enemy Sprites
sprMove = sSlime;

//Enemy Functions
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = -1;