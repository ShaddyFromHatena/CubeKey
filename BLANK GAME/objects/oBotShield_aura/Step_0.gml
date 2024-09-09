x = oBotCube.x
y = oBotCube.y

if (place_meeting(x, y, oKeyboardNote) || place_meeting(x, y, oMusicNote)) {
	
	instance_destroy();
	with(instance_find(oTopShield_aura,0))
	{
		instance_destroy();
	}
	for (i = instance_number(oKeyboardNote); i > 0; i--)
	{
		with (instance_find(oKeyboardNote,i))
		{
			if (x < 1300)
			{
				instance_destroy();
			}
		}
	}
	for (i = instance_number(oMusicNote); i > 0; i--)
	{
		with (instance_find(oMusicNote,i))
		{
			instance_destroy();
		}
	}
	
}