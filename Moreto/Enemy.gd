extends KinematicBody2D

var timer = 300
var motion = Vector2()
var gravityforce
var dir = "direita"
var time = 0
var speed = 90
var damaged = false
var player
var life = 30 

func _ready():
	player = get_parent().find_node("Personagem")
	gravityforce = 13
	
func _process(delta):
	if life <= 0:
		get_parent().remove_child(self)
		
	motion.y = motion.y + gravityforce
	
	_MoveEnemy()
	_colisao()
	motion = move_and_slide(motion, Vector2.UP)
func _MoveEnemy():
	if damaged == false: 
		if dir =="esquerda":
			get_child(0).flip_h = true
			get_child(0).animation = "walk"
			motion.x = speed
			time = time +1
			
		elif dir =="direita":
			get_child(0).flip_h = false
			get_child(0).animation = "walk"
			motion.x = -speed
			time = time +1

func _colisao():
	if get_slide_count() > 0:
		if get_slide_collision(0).collider.name == "dirr":
			dir = "direita"
		elif get_slide_collision(0).collider.name == "esqq":
			dir = "esquerda"
			
func _on_Arena2D_body_entered(body):
	if body.name == "personagem":
		print(body.name)
		damaged =  true
		get_child(0).Animation = "hit"
		life -= player.dano	
	if body.name == "FireBall":
		print(body.name)
		
func _on_EnemyArea_area_entered(area):
	if area.name == "FireBallArea":
		damaged = true 
		get_child(0).animation = "hit"
		life -= player.dano 
		
func _on_EnemyArea_area_exite(area):
			if area.name == "FireBallArea":
				damaged = false 
				
func _on_VirosDano_area_entered(areadano):
	if areadano.name == "personagem":
		player.life -= 50
	
