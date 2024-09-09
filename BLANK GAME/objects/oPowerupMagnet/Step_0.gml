if (place_meeting(x, y, oBotCube) or place_meeting(x, y, oTopCube)) {
	instance_destroy();
	oTopCube.magnet_timer = 600;
	oBotCube.magnet_timer = 600;
	audio_play_sound(powerUp,1,false);
}


x += hspd

if (x < -200)
{
	instance_destroy();
}