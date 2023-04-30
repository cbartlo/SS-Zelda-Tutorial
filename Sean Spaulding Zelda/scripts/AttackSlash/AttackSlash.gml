// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlash(){
	//checking to see if we've loaded this sprite sheet
	if(sprite_index != sPlayerAttackSlash){
		
		sprite_index = sPlayerAttackSlash;
		localFrame = 0;
		image_index = 0; // always set to zero when we switch animations
	}
	
	//Update Sprite
	playerAnimateSprite();
	
	if(animationEnd){
		state = PlayerStateFree;
		animationEnd = false;
		
		
	}
}