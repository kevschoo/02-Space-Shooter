extends Area2D
onready var global = get_node("/root/Global")

func _on_CrystalBody_area_entered(area):
	global.playerHealth += 6
	queue_free()
