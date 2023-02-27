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
		
		//Check for entity to activate
		//
		var _activateX = lengthdir_x(10,direction);
		var _activateY = lengthdir_y(10,direction);
		activate = instance_position(x + _activateX, y - 10 + _activateY, pEntity);
		
		// If there isn't anything to activate, then our roll happens b/c same button
		if (activate == noone or activate.entityActivateScript == -1){
				
			state = PlayerStateRoll;
			moveDistanceRemaining = distanceRoll;
		}
		else{
			//Activate the entity we found
			//Note we are using a built in function instead of what SS put in
			script_execute_ext(activate.entityActivateScript, activate.entityActivateArgs);
			
			//If this is an NPC face it towards the player (make sure entity NPC var is true!
			if(activate.entityNPC){
				with(activate){
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
				
			}
		}
	}
}