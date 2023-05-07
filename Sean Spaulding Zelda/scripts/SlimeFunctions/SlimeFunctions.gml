// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function SlimeWander(){

	sprite_index = sprMove;
	image_speed = 1.0;
	
	//At destination or gave up?
	
	if((x == xTo) and (y == yTo)) or (timePassed > enemyWanderDistance /enemySpeed){
	
		hSpeed = 0;
		vSpeed = 0;
		//End the moving animation
		if(image_index < 1){
						
			image_speed = 0.0;
			image_index = 0;
		}
		//Set a new destination
		if(++wait >= waitDuration){
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart, ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
			
		}
		
	}
	else{//Move towards new destination
		
		timePassed++;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if(_distanceToGo < enemySpeed){
			_speedThisFrame = _distanceToGo;	
		}
		dir = point_direction(x,y,xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if(hSpeed != 0){
			image_xscale = sign(hSpeed);	
		}
		
		//Collide and Move
		var _collided = EnemyTileCollision();
}
	
	//Check for aggro
	if(++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if(instance_exists(oPlayer)) and (point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius){
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
						
		}
			
	}
	
}

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
function SlimeChase(){
	sprite_index = sprMove;
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if(_distanceToGo > enemySpeed){
			hSpeed = lengthdir_x(enemySpeed,dir);	
			vSpeed = lengthdir_y(enemySpeed,dir);			
			
		}
		else{
			hSpeed = lengthdir_x(_distanceToGo,dir);	
			vSpeed = lengthdir_y(_distanceToGo,dir);		
			
			
		}
		if(hSpeed != 0){
			image_xscale = sign(hSpeed);	
		}
		var _collided = EnemyTileCollision();
	}
	
	if(instance_exists(target)) and (point_distance(x,y,target.x,target.y) <=enemyAttackRadius){
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		//target 8px past player
		xTo += lengthdir_x(8,dir);
		yTo += lengthdir_y(8,dir);
		
	}
}
	
function SlimeHurt(){
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if(_distanceToGo > enemySpeed){
		image_speed = 1.0;
		dir = point_direction(x,y,xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if(hSpeed != 0){
			image_xscale = -sign(hSpeed);	
		}
		if(EnemyTileCollision() == true){
			xTo = x;
			yTo = y;
			
		}
	}
	else{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK){
			state = statePrevious;	
		}
		else{
			state = ENEMYSTATE.CHASE;	
			
		}
		
		
	}
	
}
	
function SlimeDie(){
		sprite_index = sprDie;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		if(_distanceToGo > enemySpeed){
			dir = point_direction(x,y,xTo, yTo);
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
			if(hSpeed != 0){
				image_xscale = -sign(hSpeed);	
			}
			EnemyTileCollision();
		}
		else{
			x = xTo;
			y = yTo;
		}
		//Checking the death animation
		if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
				instance_destroy();
			
		}
		
	}