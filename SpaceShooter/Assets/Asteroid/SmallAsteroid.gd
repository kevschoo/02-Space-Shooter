extends Area2D
var health = preload("res://Assets/Crystals/Crystal.tscn")
var AstHealth = 7

func _on_Game_area_entered(area):
	AstHealth -= 1

func _process(delta):
	if AstHealth <= 0:
		var hp =  health.instance()
		hp.position = self.global_position
		get_parent().add_child(hp)
		queue_free()
