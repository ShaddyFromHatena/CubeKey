var _key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"))

vsp += grv;

if (jump_scheduled)
{
	jump_timer++
	
	if (jump_timer > jump_delay || !place_meeting(x,y+sign(grv),partner_cube))
	{
		vsp = jump_speed;
		jump_scheduled = false;
	}
}

if (_key_jump && (place_meeting(x,y+sign(grv),partner_cube) || place_meeting(x,y+sign(grv),oKeyboardNote)) && !jump_scheduled)
{
	jump_scheduled = true;
	jump_timer = 0;
}

if ((place_meeting(x,y+vsp,partner_cube) || place_meeting(x,y+vsp,oKeyboardNote) || place_meeting(x,y+vsp,oVerticalBlockades)))
{
	while (!(place_meeting(x,y+sign(vsp),partner_cube) || place_meeting(x,y+sign(vsp),oKeyboardNote) || place_meeting(x,y+vsp,oVerticalBlockades)))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y += vsp;

if powerup = "shield" {
	instance_create_layer(x, y, "Instances", oBotShield_aura);
	powerup = ""
	}

if (powerup == "gun")
{
	timer -= 1;
	if (timer < 1)
	{
		if gun = true && bullets_fired < 46 
		{
			bullets_fired += 1;
		} 
		else 
		{
			gun = false;
			powerup = "";
			bullets_fired = 0;
		}
		instance_create_layer(x,y,"Instances",oBullet);
		timer = 32;
		show_debug_message(timer)
	}
}

if (powerup = "magnet")
{
	instance_create_layer(x, y, "Instances", oBotMagnet_aura);
	instance_create_layer(x, y, "Instances", oTopMagnet_aura);
	powerup = "";
}