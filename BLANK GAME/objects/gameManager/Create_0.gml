spawn_x = 1400;
spawn_y = 4;
spawn_y_mult = 63;
spawn_x_mult = 120;

difficulty = 0;
difficulty_delay = 720;
difficulty_timer = 0;
spawn_delay = 120;
spawn_timer = 0;

max_score_timer = 200;
score_timer = random_range(0,max_score_timer);

max_powerup_timer = 550;
min_powerup_timer = 350;
powerup_timer = random_range(min_powerup_timer,max_powerup_timer);

spawn_y_min = 30;
spawn_y_max = 740;
skeleton_spawn_offset = 300;
skeleton_timer = 0;
skeleton_delay = 1500;

lost = false;
total_score = 0;

audio_stop_all();

function lose()
{
	if not lost
	{
		lost = true;
		// Stop music
		audio_stop_sound(notes_1);
		audio_stop_sound(notes_2);
		audio_stop_sound(notes_3);
		audio_stop_sound(notes_4);
		audio_stop_sound(notes_5);
		audio_stop_sound(notes_6);
		audio_stop_sound(notes_7);
		audio_stop_sound(notes_8);
		audio_stop_sound(notes_9);
		audio_stop_sound(notes_10);
		// Move UI onscreen
		with(instance_find(oGameOver,0))
		{
			y -= 700
		}
		with(instance_find(oButtonRetry,0))
		{
			y -= 700
		}
		// Destroy all notes and skeletons
		for (i = instance_number(oKeyboardNote); i >= 0; i--)
		{
			with (instance_find(oKeyboardNote,i))
			{
				instance_create_layer(x, y, "KeyboardNotes",oFallingKeyboard)
				instance_destroy();
			}
		}
	}
	// Allow input for resetting the game state.
}

function gain_score(_added_score)
{
	total_score += _added_score
}

// List of Patterns:
patterns = 
[
	{
		notes : [{x:0,y:8},{x:2,y:4},{x:4,y:6},{x:8,y:8},{x:10,y:6},{x:12,y:9},{x:14,y:8},{x:16,y:3},{x:18,y:4},{x:20,y:6},{x:22,y:8},{x:24,y:1},{x:26,y:3},{x:28,y:4},{x:30,y:6},{x:32,y:8},{x:34,y:4},{x:36,y:3},{x:40,y:8},{x:44,y:4},{x:48,y:6},{x:50,y:4},{x:52,y:3},{x:54,y:1},{x:56,y:4},{x:60,y:8}], // Array of notes to spawn in {x,y} format.
		audio : notes_1, // Audio file to be played (Might need to delay depending).
		delay : 1930, // Delay in frames until next pattern can spawn. 30 * length in seconds.
		weight : 1, // Weight values below 1 will never spawn unless a difficulty modifier causes them to.
		difficulty : 0 // Amount to adjust weight by each time difficulty increases.
	},
	{
		notes : [{x:0,y:8},{x:2,y:11},{x:3,y:4},{x:4,y:6},{x:6,y:4},{x:7,y:1},{x:8,y:8},{x:11,y:6},{x:12,y:8},{x:13,y:9},{x:14,y:6},{x:15,y:4},{x:16,y:3},{x:17,y:4},{x:19,y:6},{x:20,y:8},{x:22,y:9},{x:24,y:1},{x:25,y:3},{x:26,y:4},{x:27,y:6},{x:29,y:4},{x:30,y:9},{x:31,y:8},{x:32,y:6},{x:34,y:4},{x:35,y:3},{x:37,y:0},{x:38,y:1},{x:40,y:4},{x:44,y:1},{x:46,y:8},{x:48,y:6},{x:49,y:4},{x:51,y:3},{x:52,y:4},{x:53,y:3},{x:55,y:1},{x:56,y:4},{x:58,y:8},{x:61,y:6},{x:62,y:4}],
		audio : notes_2,
		delay : 1930,
		weight : 1,
		difficulty : 0
	},
	{
		notes : [{x:0,y:8},{x:2,y:4},{x:4,y:6},{x:5,y:4},{x:7,y:6},{x:8,y:8},{x:10,y:6},{x:11,y:8},{x:12,y:9},{x:13,y:8},{x:14,y:6},{x:15,y:4},{x:16,y:3},{x:17,y:1},{x:18,y:4},{x:19,y:3},{x:20,y:6},{x:21,y:4},{x:22,y:8},{x:23,y:6},{x:24,y:9},{x:25,y:8},{x:26,y:1},{x:27,y:3},{x:28,y:4},{x:30,y:8},{x:32,y:6},{x:33,y:4},{x:34,y:3},{x:35,y:1},{x:37,y:4},{x:40,y:8},{x:41,y:6},{x:42,y:4},{x:43,y:1},{x:45,y:4},{x:48,y:6},{x:49,y:5},{x:50,y:4},{x:51,y:3},{x:52,y:2},{x:53,y:1},{x:54,y:0},{x:55,y:1},{x:57,y:4},{x:59,y:8}],
		audio : notes_3,
		delay : 1930,
		weight : 1,
		difficulty : 0
	},
	{
		notes : [{x:0,y:8},{x:2,y:11},{x:3,y:4},{x:4,y:6},{x:6,y:4},{x:8,y:8},{x:10,y:6},{x:12,y:8},{x:14,y:4},{x:16,y:3},{x:17,y:4},{x:19,y:6},{x:20,y:8},{x:22,y:9},{x:24,y:1},{x:26,y:3},{x:28,y:4},{x:30,y:6},{x:31,y:8},{x:32,y:6},{x:34,y:4},{x:36,y:3},{x:37,y:1},{x:39,y:3},{x:40,y:4},{x:44,y:1},{x:46,y:8},{x:48,y:6},{x:50,y:4},{x:52,y:3},{x:54,y:1},{x:55,y:3},{x:56,y:4},{x:58,y:8},{x:59,y:6},{x:60,y:8}],
		audio : notes_4,
		delay : 1930,
		weight : 1,
		difficulty : 0
	},
	{
		notes : [{x:0,y:8}],
		audio : notes_5,
		delay : 1930,
		weight : 0,
		difficulty : 0
	},
	{
		notes : [{x:0,y:8}],
		audio : notes_6,
		delay : 1930,
		weight : 0,
		difficulty : 0
	},
	{
		notes : [{x:0,y:8}],
		audio : notes_7,
		delay : 1930,
		weight : 0,
		difficulty : 0
	},
	{
		notes : [{x:0,y:8}],
		audio : notes_8,
		delay : 1930,
		weight : 0,
		difficulty : 0
	}
]

// Pattern Functions
function get_total_weight()
{
	var _total_weight = 0;
	for (i = 0; i < array_length(patterns); i++)
	{
		if (patterns[i].weight > 0)
			_total_weight += patterns[i].weight
	}
	return _total_weight;
}

function get_pattern_at_weight(_weight)
{
	var _total_weight = 0;
	for (i = 0; i < array_length(patterns); i++)
	{
		if (patterns[i].weight > 0)
			_total_weight += patterns[i].weight
			if (_total_weight > _weight)
				return patterns[i]
	}
}

function increase_difficulty()
{
	for (i = 0; i < array_length(patterns); i++)
	{
		patterns[i].weight += patterns[i].difficulty
	}
	skeleton_delay *= 0.95;
}