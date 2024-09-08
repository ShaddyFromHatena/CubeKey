if (place_meeting(x, y, oBotCube) or place_meeting(x, y, oTopCube)) {
	instance_destroy();
	oTopCube.powerup = "magnet"
	oBotCube.powerup = "magnet"
}


x += hspd