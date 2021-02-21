extends Control

onready var global = get_node("/root/Global")

func _on_Play_pressed():
	#get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

func _on_Quit_pressed():
	get_tree().quit()
	
func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/MenuScenes/Credits.tscn")

func _on_Controls_pressed():
	get_tree().change_scene("res://Scenes/MenuScenes/Controls.tscn")
	
func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/MenuScenes/Menu.tscn")
