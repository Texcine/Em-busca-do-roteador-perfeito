extends KinematicBody2D

var motion = Vector2()
var speed = 200
var gravityForce = 13

func _physics_process(delta):


	motion.y = motion.y + gravityForce



	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		
		get_child(0).flip_h = false
		get_child(0).animation = "Walk"
	elif Input.is_action_pressed("ui_left"):

		motion.x = -speed
		get_child(0).flip_h = true
		get_child(0).animation = "Walk"
	else:
		
		motion.x = 0
		get_child(0).animation = "Idle"
	
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			motion.y = -350
		
	
	if get_slide_count() > 0:
		if get_slide_collision(0).collider.name == "void":
			get_tree().change_scene("res://FASES/fase 1.tscn")
		
		if get_slide_collision(0).collider.name == "void2":
			get_tree().change_scene("res://FASES/fase2.tscn")
	
	
	
		if get_slide_collision(0).collider.name == "roteador":
			get_tree().change_scene("res://FASES/fase2.tscn")
	
		if get_slide_collision(0).collider.name == "roteadors":
			get_tree().change_scene("res://FASES/Fase3.tscn")
	
	
		if get_slide_collision(0).collider.name == "void3":
			get_tree().change_scene("res://FASES/Fase3.tscn")
	
		if get_slide_collision(0).collider.name == "roteador3":
			get_tree().change_scene("res://FASES/fase4.tscn")
			get_tree().change_scene("res://FASES/ase3.tscn")
	
	motion = move_and_slide(motion, Vector2.UP)
