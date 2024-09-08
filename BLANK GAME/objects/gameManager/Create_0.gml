spawn_x = 1400;
spawn_y = 4;
spawn_y_min = 0;
spawn_y_max = 770;
spawn_y_mult = 63;
spawn_x_mult = 120;

difficulty = 0;
difficulty_delay = 720;
difficulty_timer = 0;
spawn_delay = 120;
spawn_timer = 0;

max_powerup_timer = 900;
min_powerup_timer = 500;
powerup_timer = random_range(min_powerup_timer,max_powerup_timer);

lost = false;
score = 0;

function lose()
{
	if not lost
	{
		lost = true;
		with(instance_find(oGameOver,0))
		{
			y -= 700
		}
		with(instance_find(oButtonRetry,0))
		{
			y -= 700
		}
	}
	// Allow input for resetting the game state.
	// Do any necessary music changes.
	// Stop new note spawns.
	// Cause all notes to fall off the chart or something-?
}

function gain_score(_added_score)
{
	score += _added_score
}

// List of Patterns:
patterns = 
[
	{
		notes : [{x:0,y:8},{x:2,y:4},{x:4,y:6},{x:8,y:8},{x:10,y:6},{x:12,y:9},{x:14,y:8},{x:16,y:3},{x:18,y:4},{x:20,y:6},{x:22,y:8},{x:24,y:1},{x:26,y:3},{x:28,y:4},{x:30,y:6},{x:32,y:8},{x:34,y:4},{x:36,y:3},{x:40,y:8},{x:44,y:4},{x:48,y:6},{x:50,y:4},{x:52,y:3},{x:54,y:1},{x:56,y:4},{x:60,y:8}], // Array of notes to spawn in {x,y} format.
		audio : notes_1, // Audio file to be played (Might need to delay depending).
		delay : 2020, // Delay in frames until next pattern can spawn.
		weight : 8, // Weight values below 1 will never spawn unless a difficulty modifier causes them to.
		difficulty : 0 // Amount to adjust weight by each time difficulty increases.
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
}