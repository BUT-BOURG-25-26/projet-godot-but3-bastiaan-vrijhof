extends Node3D

class_name modules

@onready var level  = $"../"

var speed = 10

func _process(delta):
	position.z -= speed * delta
	if position.z  < -15:
		level.spawnModule(position.z + (level.amount*level.offset))
		queue_free()
