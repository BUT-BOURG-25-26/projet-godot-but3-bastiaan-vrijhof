extends Area3D

class_name Player

var positions = [-1,0,1]
var curPos = 1
var swipeLength = 100
var startSwipe: Vector2
var curSwipe: Vector2
var swiping = false 

var treshold = 20
var swipeDir = 0


func _process(delta):
	swipe()
	if swipeDir == 1:
		if curPos <= 1:
			curPos += 1
			position.x  = positions[curPos]
			swipeDir = 0
	elif swipeDir == -1:
		if curPos > 0:
			curPos -= 1
			position.x  = positions[curPos]
			swipeDir = 0


func swipe():
	if Input.is_action_just_pressed("Press"):
		if !swiping:
			swiping = true
			startSwipe = get_viewport().get_mouse_position()
	if Input.is_action_pressed("Press"):
		if swiping:
			curSwipe = get_viewport().get_mouse_position()
			if startSwipe.distance_to(curSwipe) >= swipeLength:
				if startSwipe.x - curSwipe.x < 0:
					swipeDir = -1
				else:
					swipeDir = 1
				print(swipeDir)
				swiping = false
	else:
		swiping = false
