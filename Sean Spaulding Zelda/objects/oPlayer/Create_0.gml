//setting the default state a reference to a function, interesting!
state = PlayerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;

spriteRun = sPlayerRun;
spriteIdle = sPlayer;
spriteRoll = sPlayerRoll;
localFrame = 0;
