x = oBotCube.x
y = oBotCube.y

if place_meeting(x, y, oKeyboardNote) {
	
	instance_destroy()
	oKeyboardNote.destroy = 1;
	
}