x = oBotCube.x
y = oBotCube.y

if place_meeting(x, y, oKeyboardNote) {
	
	instance_destroy();
	with(instance_find(oTopShield_aura,0))
	{
		instance_destroy();
	}
	for (i = 0; i < instance_number(oKeyboardNote); i++)
	{
		with (instance_find(oKeyboardNote,i))
		{
			if (x < 1000)
			{
				instance_destroy();
			}
		}
	}
	
}