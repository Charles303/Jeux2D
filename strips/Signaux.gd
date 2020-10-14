extends Node2D

var comptePoint = 0

func _ready():
	pass

func _process(delta):
	var strPoint = str(Globals.comptePoints)
	
	$VBoxContainer/Points.set_text("Score : " + strPoint)

func ShowVie(nbVie):
	var numero = str(nbVie)
	AfficherVie(numero)

func AfficherVie(num):
	var strCompte = str(num)
	$VBoxContainer/Vie.set_text("Vies : " + strCompte)
	print($VBoxContainer/Vie.text)

func PlusPoint():
	comptePoint = comptePoint + 1
