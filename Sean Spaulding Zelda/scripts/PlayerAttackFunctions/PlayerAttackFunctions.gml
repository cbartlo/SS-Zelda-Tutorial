// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAttackFunctions(){

}

function AttackSlash(){
	//checking to see if we've loaded this sprite sheet to check for start of attack
	if(sprite_index != sPlayerAttackSlash){
		
		sprite_index = sPlayerAttackSlash;
		localFrame = 0;
		image_index = 0; // always set to zero when we switch animations
		
		// Clear the hit list
		if(!ds_exists(hitByAttack, ds_type_list)){
			hitByAttack = ds_list_create();	
		}
		ds_list_clear(hitByAttack);
		
	}
	
	CalcAttack(sPlayerAttackSlashHB);
	
	
	//Update Sprite
	playerAnimateSprite();
	
	if(animationEnd){
		state = PlayerStateFree;
		animationEnd = false;
		
		
	}
}

function CalcAttack(_maskIndex){
	
	mask_index = _maskIndex;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,pEntity,hitByAttackNow,false);
	
	if(hits > 0){
		
		for(var i = 0; i < hits; i++){
			//if this instance has not yet been hit, hit it!
			var hitID = hitByAttackNow[|i];
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack,hitID);
				with(hitID){
					
					if(object_is_ancestor(object_index, pEnemy)){
						HurtEnemy(id, 5, other.id, 10);
					}
					else if(entityHitScript != -1){
							script_execute(entityHitScript);
					}
					
					
				}
				
			}
			
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sPlayer;
}

function HurtEnemy(_enemy, _damage, _source, _knockback){
		
	with(_enemy){
		if(state != ENEMYSTATE.DIE){
			enemyHP -= _damage;
			flash = 1;
			
			//Hurt or Dead?
			if(enemyHP <= 0){
				state = ENEMYSTATE.DIE;	
			}
			else{
				if( state != ENEMYSTATE.HURT){
					statePrevious = state;	
				}
				state = ENEMYSTATE.HURT;
			}
			image_index = 0;
			if(_knockback != 0){
				var _knockDirection = point_direction(x,y,(_source).x, (_source).y);	
				xTo = x - lengthdir_x(_knockback,_knockDirection);
				yTo = y - lengthdir_y(_knockback,_knockDirection);
			}
				
			}
			
		}
		
		
	}
	
	
