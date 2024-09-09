if (place_meeting(x, y, oBotCube) or place_meeting(x, y, oTopCube)) {
	instance_destroy();
	with (instance_find(oBotShield_aura,0))
	{
		instance_destroy();
	}
	with (instance_find(oTopShield_aura,0))
	{
		instance_destroy();
	}
	instance_create_layer(x, y, "Shield", oBotShield_aura);
	instance_create_layer(x, y, "Shield", oTopShield_aura);
	audio_play_sound(powerUp,1,false);
}

x += hspd

if (x < -200)
{
	instance_destroy();
}