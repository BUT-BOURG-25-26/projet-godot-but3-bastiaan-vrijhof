extends CharacterBody3D

class_name Player

@onready var animationTree: AnimationTree = $"character-female-c/AnimationTree" 

const JUMP_VELOCITY = 8.0
const GRAVITY = 25.0
const LANE_SPEED = 10.0   

var positions = [-1.0, 0.0, 1.0]
var curPos = 1      

var swipe_start = Vector2.ZERO
var is_swiping = false
var min_swipe_dist = 50    

var is_dead = false

func _ready():
	Game.reset_game()

func _physics_process(delta):
	if is_dead:
		Game.is_playing = false 
		return

	if not is_on_floor():
		velocity.y -= GRAVITY * delta
		animationTree.set("parameters/conditions/isJumping", false)
		animationTree.set("parameters/conditions/isFalling", true)
	else:
		animationTree.set("parameters/conditions/isFalling", false)
		animationTree.set("parameters/conditions/isSprinting", true)

	velocity.z = -Game.current_speed * 0.5

	var target_x = positions[curPos]
	var direction_x = target_x - position.x
	
	velocity.x = direction_x * LANE_SPEED

	move_and_slide()
	detect_collisions()

func _input(event):
	if is_dead: return

	if event is InputEventScreenTouch:
		if event.pressed:
			is_swiping = true
			swipe_start = event.position
		else:
			is_swiping = false
			_calculate_swipe(event.position)
	
	if event.is_action_pressed("ui_left"): change_lane(-1)
	if event.is_action_pressed("ui_right"): change_lane(1)
	if event.is_action_pressed("ui_accept"): do_jump()

func _calculate_swipe(swipe_end):
	var swipe = swipe_end - swipe_start
	if swipe.length() < min_swipe_dist: return 
	
	if abs(swipe.x) > abs(swipe.y):
		if swipe.x > 0: change_lane(1) 
		else: change_lane(-1)   
	else:
		if swipe.y < 0: do_jump()

func change_lane(dir):
	curPos += dir
	curPos = clamp(curPos, 0, 2) 

func do_jump():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		animationTree.set("parameters/conditions/isSprinting", false)
		animationTree.set("parameters/conditions/isJumping", true)

func detect_collisions():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider.is_in_group("obstacles"):
			game_over()

func game_over():
	if is_dead: return
	is_dead = true
	
	print("BOUM ! Game Over")
	
	Game.add_score(Game.score)
	
	animationTree.set("parameters/conditions/isSprinting", false)
	animationTree.set("parameters/conditions/isDying", true)

	var hud_node = get_tree().root.find_child("Hud", true, false)
	
	if hud_node:
		hud_node.show_game_over()
	else:
		print("Erreur : Impossible de trouver le nœud HUD pour afficher le Game Over.")
	await get_tree().create_timer(3.0).timeout 
	
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
