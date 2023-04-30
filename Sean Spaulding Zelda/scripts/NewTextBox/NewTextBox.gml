// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(_message, _background = 1){
	var _obj;
	if(instance_exists(oText)){
		_obj = oTextQueued;	
	}
	else{
		_obj = oText;	
		
	}
	//give my text object the message
	with(instance_create_layer(0,0,"Instances",_obj)){
		textValue = _message;	
		background = _background;
		if(instance_exists(other)){
			originInstance = other.id;
		}
		else{
			originInstance = noone;
		}
		
		
	}
	
	with(oPlayer){
		if(state != PlayerStateLocked){
			lastState = state;	
			state = PlayerStateLocked;
		}
		
	}
}