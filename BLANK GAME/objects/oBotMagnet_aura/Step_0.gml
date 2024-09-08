x = oBotCube.x
y = oBotCube.y

if place_meeting(x, y, oPowerupGun) {
	oPowerupGun.x = oBotCube.x
	oPowerupGun.y = oBotCube.y
}

if place_meeting(x, y, oPowerupShield) {
	oPowerupShield.x=oBotCube.x
	oPowerupShield.y=oBotCube.y
}

killswitch += 1

if killswitch = 2700 {
	killswitch = 0
	instance_destroy()
}