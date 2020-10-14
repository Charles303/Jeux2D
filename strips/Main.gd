extends Node

onready var player = $Joueur
onready var asteroid_scene = load("res://scenes/Asteroid.tscn")
onready var PetitAsteroid_scene = load("res://scenes/Asteroid.tscn")
var rng = RandomNumberGenerator.new()
var t = Timer.new()
var random

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.comptePoints = 0
	autoGenerate()

func _process(delta):
	pass

func _spawn_asteroid():
	var asteroid = asteroid_scene.instance()
	_set_asteroid_position(asteroid)
	add_child(asteroid)

func autoGenerate():
	_spawn_asteroid()

func playerPosDepart():
	player.position = Vector2(514, 290)


func _on_Timer_timeout():
	autoGenerate()

func _set_asteroid_position(asteroid):
	var rect = get_viewport().size
	random = rand_range(0,2)
	if random > 1:
		asteroid.position = Vector2(rand_range(200, rect.x), 700)
	else:
		asteroid.position = Vector2(rand_range(200, rect.x), -100)
