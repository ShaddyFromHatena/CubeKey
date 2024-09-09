// Has to be > because its speed to the left, idk why I did it like that.
if (spd > max_spd)
{
	spd += accel;
}

x += spd;

if (place_meeting(x,y,oBotCube))
{
	with(instance_find(oBotCube,0))
	{
		die()
	}
}

if (place_meeting(x,y,oTopCube))
{
	with(instance_find(oTopCube,0))
	{
		die()
	}
}

if (x < -200)
{
	instance_destroy();
}