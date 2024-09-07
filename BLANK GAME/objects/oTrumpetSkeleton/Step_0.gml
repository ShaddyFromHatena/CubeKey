// Vertical Movement
if (abs(spd + accel) < max_spd)
{
	spd += accel;
}

if ((accel > 0 && y > pivot_y_max && spd > 0) || (accel < 0 && y < pivot_y_min && spd < 0))
{
	accel = -accel;
}

y += spd;

// Horizontal Movement

var _x_diff = hold_x - x;
x += _x_diff*0.02;

// Shooting

fire_timer++;
if (fire_timer > fire_delay)
{
	fire_timer = 0;
	instance_create_layer(x + fire_offset_x, y, "TrumpetDoots",oMusicNote)
}