// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DropItems(_x,_y,_items){
	var _arrLen = array_length(_items);
	if( _arrLen > 1){
		var _anglePerItem = 360/_arrLen;
		var _angle = random(360);
		for(var i = 0; i < _arrLen; i++){
			
			with(instance_create_layer(_x,_y,"Instances",_items[i])){
				direction = _angle;
				spd = 0.75 + (_arrLen * 0.1) + random(0.1);
				
			}
			_angle += _anglePerItem;
			
		}
		
	}
	else{
		instance_create_layer(_x,_y,"Instances",_items[0]);	
	}
}