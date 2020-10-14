extends KinematicBody2D
var velocite = Vector2()
var vitesse = 300
var direction

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if collision:
		queue_free()

func creer(pos,dir):
	position = pos
	direction = dir
	velocite = Vector2(vitesse,0).rotated(direction)
	


func _on_Area2D_body_entered(body):
	if "Balle" in body.name:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
