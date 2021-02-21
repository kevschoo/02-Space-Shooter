extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score()
	update_health()

func _process(delta):
	update_health()
	update_score()

func update_score():
	$Score.text = "Score: " + str(global.playerScore)
	

func update_health():
	$Health.text = "Health: " + str(global.playerHealth)
	if global.playerHealth > global.maxHealth:
		global.playerHealth = global.maxHealth
	if global.playerHealth <= 0:
		get_tree().change_scene("res://Scenes/MenuScenes/GameOver.tscn")
		
		

