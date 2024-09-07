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
