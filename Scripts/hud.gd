extends Control

@onready var timer_label = $Label
@onready var game_over_panel = $GameOverPanel

func _process(delta):
	if Game.is_playing:
		var distance = int(Game.score)
		timer_label.text = "Distance: %d m" % distance

func show_game_over():
	game_over_panel.visible = true
	timer_label.visible = false
