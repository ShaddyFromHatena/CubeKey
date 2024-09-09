x += 12

if place_meeting(x, y, oTrumpetSkeleton) {
	
	for (i = instance_number(oTrumpetSkeleton); i >= 0; i--)
	{
		with (instance_find(oTrumpetSkeleton,i))
		{
			if place_meeting(x, y, oBullet) {
				instance_destroy();
				audio_play_sound(explosion,1,false);
			}
		}
	}
	instance_destroy()
	
}