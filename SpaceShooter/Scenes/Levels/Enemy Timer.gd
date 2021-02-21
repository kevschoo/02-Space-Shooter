extends Timer

onready var player = get_node("/root/PlayerShip")
var drone = preload("res://Assets/LargeDrone/LargeDrone.tscn")
var base = preload("res://Assets/Enemy Base/EnemyBasel.tscn")
var health = preload("res://Assets/Crystals/Crystal.tscn")
var vortex = preload("res://Assets/Vortex/Vortex.tscn")
var asteroid = preload("res://Assets/Asteroid/SmallAsteroid.tscn")
var boss = preload("res://Assets/SmallDrone/SmallDrone.tscn")
onready var global = get_node("/root/Global")


func _on_Enemy_Timer_timeout():
	global.enemywave += 1
	if wait_time >= 1.2:
		wait_time -= .1
	var v =  vortex.instance()
	v.position = $Spawn1.global_position
	get_parent().add_child(v)
	var v2 =  vortex.instance()
	v2.position = $Spawn2.global_position
	get_parent().add_child(v2)
	var v3 =  vortex.instance()
	v3.position = $Spawn3.global_position
	get_parent().add_child(v3)
	var v4 =  vortex.instance()
	v4.position = $Spawn4.global_position
	get_parent().add_child(v4)
	
	
	var enemy =  drone.instance()
	enemy.position = $Spawn1.global_position
	get_parent().add_child(enemy)
	
	var enemy2 =  drone.instance()
	enemy2.position = $Spawn2.global_position
	get_parent().add_child(enemy2)
	
	var enemy3 =  drone.instance()
	enemy3.position = $Spawn3.global_position
	get_parent().add_child(enemy3)
	
	var enemy4 =  drone.instance()
	enemy4.position = $Spawn4.global_position
	get_parent().add_child(enemy4)
	
	if fmod(global.enemywave,25) == 0:
		var hp =  health.instance()
		hp.position = $Spawn5.global_position
		get_parent().add_child(hp)
		
	if fmod(global.enemywave,10) == 0:
		var ast =  asteroid.instance()
		ast.position = $Spawn6.global_position
		get_parent().add_child(ast)
		
	if fmod(global.enemywave,8) == 0:
		var bo =  boss.instance()
		bo.position = $Spawn7.global_position
		get_parent().add_child(bo)
		
	if fmod(global.enemywave,3) == 0:
		var base1 =  base.instance()
		base1.position = $Spawn1.global_position
		get_parent().add_child(base1)
		var base2 =  base.instance()
		base2.position = $Spawn2.global_position
		get_parent().add_child(base2)
		var base3 =  base.instance()
		base3.position = $Spawn3.global_position
		get_parent().add_child(base3)
		var base4 =  base.instance()
		base4.position = $Spawn4.global_position
		get_parent().add_child(base4)
