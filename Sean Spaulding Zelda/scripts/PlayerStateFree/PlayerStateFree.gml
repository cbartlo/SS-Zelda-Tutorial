// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if(inputMagnitude != 0){
	
		direction = inputDirection;
		sprite_index = spriteRun;
	}else{
		sprite_index = spriteIdle;
	}
	if(_oldSprite != sprite_index){
		localFrame = 0;
	}

	//Update Image Index
	show_debug_message(string(localFrame));
	playerAnimateSprite();

	//Change State
	if(keyActivate){
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}