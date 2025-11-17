extends Node3D

class_name Level

@export var modules: Array[PackedScene] = []

var amount = 25
var rng = RandomNumberGenerator.new()
var offset = 4.5 

var initial = 0


func _ready() -> void:
	for n in amount:
		spawnModule(n *offset)

func spawnModule(n):
	if initial > 5:
		rng.randomize()
		var num = rng.randi_range(0, modules.size()-1)
		var instance = modules[num].instantiate()
		instance.position.z = n
		add_child(instance)
	else:
		var instance = modules[0].instantiate()
		instance.position.z = n
		add_child(instance)
		initial += 1
