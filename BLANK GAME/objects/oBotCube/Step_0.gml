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

if powerup = "shield" {
	instance_create_layer(x, y, "Instances", oBotShield_aura)
	instance_create_layer(x, y, "Instances", oTopShield_aura)
	powerup = ""
	}

if powerup == "gun" && Timer = 0
{
if gun = true && bullets_fired < 46 {
	bullets_fired += 1
} else {
	gun = false
	powerup = ""
	bullets_fired = 0
}
instance_create_layer(x,y,"Instances",oBullet)
Timer = room_speed*5
}
Timer -= 1;
Timer = clamp(Timer, 0, 60)

if powerup = "magnet" {
	instance_create_layer(x, y, "Instances", oBotMagnet_aura)
	instance_create_layer(x, y, "Instances", oTopMagnet_aura)
	powerup = ""
	}