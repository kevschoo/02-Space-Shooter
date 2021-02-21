extends Node2D
func _ready():
	$ExplosionTwo.play("explode")
	
func _on_ExplosionTwo_animation_finished():
	queue_free()
