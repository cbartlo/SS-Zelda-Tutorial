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
		if(argument_count > 1) {
			background = argument[1];
		}
		else{
			background = 1;
		}
		if(argument_count > 2){
			// first parse strings in responses
			var _array=argument[2];
			for(var _i=0;_i<array_length(_array)  ;_i++)
			{
				responses[_i]=_array[_i];
			}
			for(var i = 0; i < array_length(responses); i++){
				var _markerPosition = string_pos(":", responses[i]);  //finds first ":"
				responseScripts[i] = real(string_copy(responses[i], 1, _markerPosition-1)); // pull the number save it
				responses[i] = string_delete(responses[i], 1, _markerPosition);
				breakpoint = 10;
			}
		}
		else{
			
			responses = [-1];
			responseScripts = [-1];
			
			
			
			
		}
		
	}
	
	with(oPlayer){
		if(state != PlayerStateLocked){
			lastState = state;	
			state = PlayerStateLocked;
		}
		
	}
}