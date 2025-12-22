extends Node3D

class_name LevelGenerator

@export var safe_modules: Array[PackedScene]    
@export var obstacle_modules: Array[PackedScene] 
@export var player: Player               

@export var module_length: float = 4.49        
@export var amount_to_spawn: int = 15        

var spawn_z = 0           
var modules_spawned_count = 0 
var active_modules = []    

func _ready():
	for i in range(amount_to_spawn):
		spawn_module()

func _process(delta):
	if player.position.z < spawn_z + (module_length * (amount_to_spawn - 2)):
		spawn_module()
		delete_old_module()

func spawn_module():
	var module_scene
	print (modules_spawned_count)
	if modules_spawned_count < 5 :
		module_scene = safe_modules.pick_random()
		
	else:
		var phase_count = modules_spawned_count - 5
		
		if phase_count % 2 == 0:
			module_scene = obstacle_modules.pick_random() 
		else:
			module_scene = safe_modules.pick_random()  

	var instance = module_scene.instantiate()
	instance.position.z = spawn_z
	add_child(instance)
	
	active_modules.append(instance)
	spawn_z -= module_length
	modules_spawned_count += 1

func delete_old_module():
	if active_modules.size() > amount_to_spawn + 2:
		var old_module = active_modules.pop_front()
		old_module.queue_free()
