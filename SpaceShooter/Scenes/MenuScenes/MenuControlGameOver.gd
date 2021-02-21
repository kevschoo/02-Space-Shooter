extends Control

onready var global = get_node("/root/Global")

func _ready():
	$Score.text = "Score: " + str(global.playerScore)
	$Time.text = "Time Alive: " + str(global.currentTimeAlive)
	$Wave.text = "Wave: " + str(global.enemywave)
func _on_Play_pressed():
	global.playerScore = 0
	global.playerHealth = 10
	global.currentTimeAlive = 0
	global.enemywave = 0
	get_tree().reload_current_scene()
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	

func _on_Quit_pressed():
	get_tree().quit()

	
func _on_Menu_pressed():
	global.playerScore = 0
	global.playerHealth = 10
	global.currentTimeAlive = 0
	global.enemywave = 0
	get_tree().reload_current_scene()
	get_tree().change_scene("res://Scenes/MenuScenes/Menu.tscn")
