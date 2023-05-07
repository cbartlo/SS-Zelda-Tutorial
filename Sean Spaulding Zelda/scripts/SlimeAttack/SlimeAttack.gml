// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeAttack(){
	//How Fast to Move
	var _spd = enemySpeed;
	
	//Don't move while prepping jump
	if(image_index < 2){
		_spd = 0;
	}
	
	//Freeze animation while in mid air
	
	if(floor(image_index) == 3) or (floor(image_index) == 5){
		image_speed = 0;	
	}
	
	//How far to jump
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	//begin landing animation
	if(_distanceToGo < 4) and (image_index < 5){
		image_speed = 1.0;	
		
	}
	
	//Move
	if(_distanceToGo > _spd){
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		
		if(hSpeed != 0){
			image_xscale = sign(hSpeed);	
		}
		
		//move and stop if we hit something
		if(EnemyTileCollision() == true){
			
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		if(floor(image_index) == 5){
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
			
		}
		
		
		
	}
	
	
}