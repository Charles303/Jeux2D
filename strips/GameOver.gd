extends Control

onready var mainMenu = $MainMenuButton
onready var restart = $RestartButton



# Called when the node enters the scene tree for the first time.
func _ready():
	var strCompte = str(Globals.comptePoints)
	$Points.set_text("Score : " + strCompte)





func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/Depart.tscn")



func _on_RestartButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
