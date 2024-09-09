if (place_meeting(x, y, oBotCube) or place_meeting(x, y, oTopCube)) {
	instance_destroy();
	instance_create_layer(x, y, "Shield", oBotShield_aura);
	instance_create_layer(x, y, "Shield", oTopShield_aura);
}

x += hspd