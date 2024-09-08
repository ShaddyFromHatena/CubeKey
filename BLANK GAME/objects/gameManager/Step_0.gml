difficulty_timer++;
if (difficulty_timer > difficulty_delay)
{
	increase_difficulty()
	difficulty_timer = 0;
}

spawn_timer++;
if (spawn_timer > spawn_delay)
{
	var _new_weight = random_range(0, get_total_weight())
	var _new_pattern = get_pattern_at_weight(_new_weight)
	var _notes = _new_pattern.notes
	for (i = 0; i < array_length(_notes); i++)
	{
		var _new_x = _notes[i].x
		var _new_y = _notes[i].y
		instance_create_layer(spawn_x + _new_x, _new_y, "KeyboardNotes",oKeyboardNote)
	}
	
	
	
	audio_play_sound(_new_pattern.audio,1,false)
	spawn_timer = 0;
	spawn_delay = _new_pattern.delay
}

// Decrease the timer
powerup_timer -= 1;

// Check if the timer has reached zero
if (powerup_timer <= 0) {
    // Reset the timer
    powerup_timer = room_speed * 30

    // Choose a random object to spawn
    var obj_to_spawn;
    switch (irandom(2)) {
        case 0:
            obj_to_spawn = oPowerupMagnet;
            break;
        case 1:
            obj_to_spawn = oPowerupGun;
            break;
        case 2:
            obj_to_spawn = oPowerupShield;
            break;
    }

    // Spawn the chosen object at a random position
    instance_create_layer(spawn_x, random_range(spawn_y_min, spawn_y_max), "Instances", obj_to_spawn);
}
