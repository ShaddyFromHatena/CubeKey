vsp = 0;
grv = 0.5;
jump_speed = -12;
partner_cube = oTopCube;
jump_delay = 5;
jump_scheduled = false;
jump_timer = 0;
powerup = ""
bullets_fired = 0
image_speed = 0;
gun = false;

// Sprite Animating Stuff
image_index = 0;
image_speed = 0;

magnet_timer = 0;

timer = 0;

function die()
{
	// Check for shield first
	var _aura = instance_find(oBotShield_aura,0)
	if (_aura)
	{
		with(_aura)
		{
			instance_destroy();
			with(instance_find(oTopShield_aura,0))
			{
				instance_destroy();
			}
			for (i = instance_number(oKeyboardNote); i >= 0; i--)
			{
				with (instance_find(oKeyboardNote,i))
				{
					if (x < 1300)
					{
						instance_destroy();
					}
				}
			}
			for (i = instance_number(oMusicNote); i >= 0; i--)
			{
				with (instance_find(oMusicNote,i))
				{
					instance_destroy();
				}
			}
		}
		
	}
	else
	{
		// Change graphic to dead graphic.
		// Play any necessary death sounds.
		// Play any particle effects that need added to the death graphic.
		x = -100
		with(instance_find(gameManager,0))
		{
			lose()
		}
	}
}