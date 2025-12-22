extends Node

const INITIAL_SPEED = 10.0
const SPEED_INCREASE_PER_SECOND = 0.2

var score = 0.0
var current_speed = 10.0
var is_playing = false

var save_path = "user://highscores.save" 
var high_scores = []

func _ready():
	load_scores()

func _process(delta):
	if is_playing:
		current_speed = INITIAL_SPEED + (delta * SPEED_INCREASE_PER_SECOND)
		
		score += current_speed * delta

func reset_game():
	score = 0.0
	current_speed = INITIAL_SPEED
	is_playing = true

func add_score(new_score):
	high_scores.append(new_score)
	
	high_scores.sort()
	high_scores.reverse()
	
	if high_scores.size() > 10:
		high_scores = high_scores.slice(0, 9)
	
	save_scores()

func save_scores():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(high_scores)

func load_scores():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		high_scores = file.get_var()
	else:
		high_scores = []
