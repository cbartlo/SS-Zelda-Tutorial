// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	//Check Horizontal Tiles 
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)){
		//this moves us to the far left of the tile
		x -= x mod TILE_SIZE;
		//if we are moving right,bumps us to far right instead
		if(sign(hSpeed) == 1){
			x += TILE_SIZE -  1;	
		}
		
		hSpeed = 0;
		_collision = true;
		
	}
	//Horizontal Entities
	var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move close it it
			if(sign(hSpeed) == -1){
				_snapX = _entityCheck.bbox_right +1;
			}
			else{
				_snapX = _entityCheck.bbox_left - 1;
			}
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
			
		}
		ds_list_delete(_entityList,0);
		_entityCount--;
		
	}
	
	
	
	
	//Actually move Horizontally
	x += hSpeed;
	
	//Clear list between axis checks
	ds_list_clear(_entityList);
	
	//check Vertical Tiles
	
	if(tilemap_get_at_pixel(collisionMap, x , y + vSpeed)){
		//this moves us to the top of the tile
		y -= y mod TILE_SIZE;
		//if we are moving down,bumps us to bottom instead
		if(sign(vSpeed) == 1){
			y += TILE_SIZE -  1;	
		}
		
		vSpeed = 0;
		_collision = true;
		
	}
	
	
	
	//Vertical Entities
	var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false);
	var _snapY;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move close it it
			if(sign(vSpeed) == -1){
				_snapY = _entityCheck.bbox_bottom +1;
			}
			else{
				_snapY = _entityCheck.bbox_top - 1;
			}
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
			
		}
		ds_list_delete(_entityList,0);
		_entityCount--;
		
	}
	//Actually move Vertically
	y += vSpeed;
	
	
	ds_list_destroy(_entityList);
	return _collision;
}