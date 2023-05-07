/// @description Drawing Health
// You can write your code in this editor

var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth); // returns the decimal part of a number
_playerHealth -= _playerHealthFrac;

for(var i = 1; i <= _playerHealthMax; i++){
	
	var _imageIndex = (i > _playerHealth); //get 1 or 0 based on this condition
	if(i == _playerHealth + 1){
		//shifting index to find the correct partial heart image
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > 0.25);
		_imageIndex += (_playerHealthFrac > 0.5);
		
	}
	draw_sprite(sHealth, _imageIndex, 8 + ((i-1) * 16),8);
	display_set_gui_size(320,180);
	
}