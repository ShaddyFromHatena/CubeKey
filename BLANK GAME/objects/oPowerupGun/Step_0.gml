if (place_meeting(x, y, oBotCube) or place_meeting(x, y, oTopCube)) 
{
	instance_destroy();
	oTopCube.powerup = "gun"
	oBotCube.powerup = "gun"
	oTopCube.gun = true
	oBotCube.gun = true
}


x += hspd