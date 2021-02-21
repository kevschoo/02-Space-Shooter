extends Area2D
onready var player = get_node("/root/PlayerShip")
var minion = load("res://Assets/LargeDrone/LargeDrone.tscn")
onready var global = get_node("/root/Global")

var BaseHealth = 15
var currentminions = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if BaseHealth <= 5:
		$Base.play("Low")
	if BaseHealth <= 0:
		queue_free()
		global.playerScore += 10

func _on_BaseNode_area_entered(area):
	BaseHealth -= 1

func _on_Respawner_timeout():
	if currentminions < global.maxMinions:
		var minionspawn = minion.instance()
		minionspawn.global_position = global_position
		player.add_child(minionspawn)
		currentminions += 1

