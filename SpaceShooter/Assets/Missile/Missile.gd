extends Area2D
onready var Explosions = get_node("/root/PlayerShip")
var Explosion = load("res://Assets/Explosions/ExplosionOne.tscn")
onready var VP = get_viewport().size

export var Velocity = Vector2(0,-1)
export var Acceleration = Vector2(0,-1)

var speed = 175
var velocity = Vector2()
var acceleration = 50

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)
	
func _physics_process(delta):
	move_local_x(delta * speed)


func _on_LifeTime_timeout():
	var explosion = Explosion.instance()
	explosion.global_position = global_position
	Explosions.add_child(explosion)
	call_deferred('free')


func _on_MissileBody_area_entered(area):
	var explosion = Explosion.instance()
	explosion.global_position = global_position
	Explosions.add_child(explosion)
	call_deferred('free')
