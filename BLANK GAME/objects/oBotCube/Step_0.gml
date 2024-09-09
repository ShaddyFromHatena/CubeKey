var _key_jump = keyboard_check(vk_up) || keyboard_check(ord("W"))

vsp += grv;

if (image_index == 3)
{
	image_index = 4;
}
if (image_index == 4 && sign(vsp) == sign(grv))
{
	image_index = 5;
}

if (_key_jump && (place_meeting(x,y+sign(grv),partner_cube) || place_meeting(x,y+sign(grv),oKeyboardNote)) && !jump_scheduled)
{
	jump_scheduled = true;
	jump_timer = 0;
	image_index = 1;
}

if (jump_scheduled)
{
	image_index = 2;
	
	jump_timer++
	
	if (jump_timer > jump_delay || !place_meeting(x,y+sign(grv),partner_cube))
	{
		audio_play_sound(jump,1,false)
		vsp = jump_speed;
		jump_scheduled = false;
		image_index = 3;
	}
}

if ((place_meeting(x,y+vsp,partner_cube) || place_meeting(x,y+vsp,oKeyboardNote) || place_meeting(x,y+vsp,oVerticalBlockades)))
{
	while (!(place_meeting(x,y+sign(vsp),partner_cube) || place_meeting(x,y+sign(vsp),oKeyboardNote) || place_meeting(x,y+vsp,oVerticalBlockades)))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	if (!jump_scheduled)
	{
		image_index = 0;
	}
}

y += vsp;

if (magnet_timer > 0)
{
	magnet_timer--;
	for (i = 0; i < instance_number(oScoreColl); i++)
	{
		var _score_coll = instance_find(oScoreColl,i);
		var _dist = distance_to_object(_score_coll)
		if (_dist < 500)
		{
			// get direction
			var _x_dir = x - _score_coll.x;
			var _y_dir = y - _score_coll.y;
			// normalize direction
			var _len = sqrt(sqr(_x_dir) + sqr(_y_dir));
			_x_dir /= _len;
			_y_dir /= _len;
			// multiply by speed we want it to go
			_x_dir *= 8;
			_y_dir *= 8;
			// set to normalized direction
			_score_coll.x_spd = _x_dir;
			_score_coll.y_spd = _y_dir;
		}
	}
}
if (powerup == "gun")
{
	timer -= 1;
	if (timer < 1)
	{
		if gun = true && bullets_fired < 30
		{
			bullets_fired += 1;
		} 
		else 
		{
			gun = false;
			powerup = "";
			bullets_fired = 0;
		}
		audio_play_sound(laserShoot,1,false)
		instance_create_layer(x,y,"Instances",oBullet);
		timer = 60;
		show_debug_message(timer)
	}
}
