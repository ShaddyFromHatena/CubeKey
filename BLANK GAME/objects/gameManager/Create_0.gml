spawn_x = 1400;
spawn_y_min = 0;
spawn_y_max = 770;

difficulty = 0;
difficulty_delay = 720;
difficulty_timer = 0;
spawn_delay = 120;
spawn_timer = 0;

max_powerup_timer = 40;
min_powerup_timer = 20;
powerup_timer = random_range(min_powerup_timer,max_powerup_timer);

score = 0;

function lose()
{
	// Show a game-over graphic.
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
		notes : [{x:0,y:100}], // Array of notes to spawn in {x,y} format.
		audio : testSound1, // Audio file to be played (Might need to delay depending).
		delay : 64, // Delay in frames until next pattern can spawn.
		weight : 8, // Weight values below 1 will never spawn unless a difficulty modifier causes them to.
		difficulty : -1 // Amount to adjust weight by each time difficulty increases.
	},
	{
		notes : [{x:0,y:300},{x:256,y:500},{x:356,y:600}],
		audio : testSound2,
		delay : 200,
		weight : 1,
		difficulty : 1
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