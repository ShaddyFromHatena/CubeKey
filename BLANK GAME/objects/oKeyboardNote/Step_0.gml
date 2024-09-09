x += hsp;

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