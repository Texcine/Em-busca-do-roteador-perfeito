extends KinematicBody2D

var vivo = true
var speed = 100
var motion = Vector2()
var gravity = 13

func _physics_process(delta):
	motion = move_and_slide(motion, Vector2.UP)
	
	if get_slide_count() > 0:
		if get_slide_collision(0).collider.name == "Mureta":
			get_tree().change_scene("res:// Arthur Cardinali/Fase 1.tscn")
		elif get_slide_collision(0).collider.name == "void":
			get_tree().change_scene("res://Arthur Cardinali/Fase 1.tscn")
		elif get_slide_collision(0).collider.name == "roteador":
			get_tree().change_scene("res://Cardinali/Fase 2.tscn")
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		
	else:
		motion.x = 0

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -300
	else:
		motion.y = motion.y + gravity
