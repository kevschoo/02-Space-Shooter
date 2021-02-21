extends Node

var playerScore = 0
var playerHealth = 10
var maxHealth = 25
var currentLevel = 0
var maxMinions = 25
var currentTimeAlive = 0
var enemywave = 0


func _process(delta):
	if Input.is_action_pressed("quit"):	
		get_tree().quit()
