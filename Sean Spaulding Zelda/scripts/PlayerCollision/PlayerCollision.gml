// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
	
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
	//Actually move Horizontally
	x += hSpeed;
	
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
	
	//Actually move Vertically
	y += vSpeed;
	
	
	
	return _collision;
}