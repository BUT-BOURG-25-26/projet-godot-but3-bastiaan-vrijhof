extends Control

@onready var score_panel = $ScorePanel
@onready var score_list = $ScorePanel/ScoreList

func _ready():
	score_panel.visible = false

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_score_button_pressed():
	score_list.clear()
	var scores = Game.high_scores
	
	for s in scores:
		score_list.add_item("%d m" % int(s))
	
	score_panel.visible = true

func _on_quit_button_pressed():
	get_tree().quit()

func _on_close_button_pressed():
	score_panel.visible = false
