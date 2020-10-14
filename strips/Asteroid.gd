extends KinematicBody2D

var vitesse = 200
var velocite = Vector2()
export (PackedScene) var petitAsteroid
onready var positionAsteroid = $Polygon2D
export (PackedScene) var Signaux
var rng = RandomNumberGenerator.new()
var dir = 0
var t = Timer.new()
var is_exploded := false


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var my_rotation = rng.randf_range(0, 360)
	dir = my_rotation
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	rotation = dir
	velocite = Vector2(vitesse,0).rotated(rotation)
	var collision = move_and_collide(velocite*delta)
	if collision:
		pass
	




func points():
	Globals.comptePoints += 1

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "Balle" in body.name:
		points()
		queue_free()
