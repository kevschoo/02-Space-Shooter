extends Area2D

export var Velocity = Vector2(0,-1)
export var Acceleration = Vector2(0,-1)

var speed = 500
var velocity = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)
	
func _physics_process(delta):
	move_local_x(delta * speed)
	
func _on_Lifetime_timeout():
	queue_free()
func _on_LaserBody_body_entered(body):
	queue_free()
func _on_LaserBody_area_entered(area):
	queue_free()
