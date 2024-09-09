if (place_meeting(x,y,oBotCube) || place_meeting(x,y,oTopCube))
{
	instance_destroy()
	audio_play_sound(pickupCoin,1,false)
	with(instance_find(gameManager,0))
	{
		gain_score(1)
	}
}

x += x_spd;
y += y_spd;