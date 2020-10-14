extends KinematicBody2D

var vitesse = 500
var velocite = Vector2()
var direction


func _ready():
	pass

func creer(pos,dir):
	position = pos
	direction = dir
	velocite = Vector2(vitesse,0).rotated(direction)

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "Asteroid" in body.name:
		queue_free()


