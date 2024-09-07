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

if ((place_meeting(x,y+vsp,partner_cube) || place_meeting(x,y+vsp,oKeyboardNote)))
{
	while (!(place_meeting(x,y+sign(vsp),partner_cube) || place_meeting(x,y+sign(vsp),oKeyboardNote)))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y += vsp;