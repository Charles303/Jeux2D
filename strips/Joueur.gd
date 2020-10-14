extends KinematicBody2D

var vitesse = 100
var velocite = Vector2()
export (PackedScene) var balle
export (PackedScene) var signaux
onready var canon = $canon
var nbVie = 3
signal mortJoueur

func _ready():
	pass



func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 10:
		rotation = dir.angle()
		velocite = move_and_slide(velocite)
	var collision = move_and_collide(velocite*delta)


func mort():
	emit_signal("mortJoueur")
	queue_free()
	perdreVie()

func perdreVie():
	nbVie = nbVie - 1
	respawn()

func respawn():
	#get_parent().playerPosDepart()
	#get_tree().reload_current_scene()
	pass


func get_input():
	var avance = Input.is_action_pressed("ui_up")
	var shoot = Input.is_action_just_pressed("ui_accept")
	var dead = Input.is_action_just_pressed("ui_down")
	
	if avance:
		velocite = Vector2(vitesse,0).rotated(rotation)
	if shoot:
		var b = balle.instance()
		b.creer(canon.global_position,rotation)
		get_parent().add_child(b)
	if dead:
		queue_free()


func _on_FormeJoueur_body_entered(body):
	if "Asteroid" in body.name:
		mort()


func _on_Joueur_mortJoueur():
	get_tree().change_scene("res://scenes/GameOver.tscn")
