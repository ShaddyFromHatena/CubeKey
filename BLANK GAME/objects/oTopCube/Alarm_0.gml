if powerup == "gun" {
	instance_create_layer(x +16, y, "instances", oBullet)
	bullets_fired+=1
	show_debug_message("bullet")
}