if place_meeting(x, y, oBotCube or oTopCube) {
	instance_destroy();
	oTopCube.powerup = "magnet"
	oBotCube.powerup = "magnet"
}


x += hspd