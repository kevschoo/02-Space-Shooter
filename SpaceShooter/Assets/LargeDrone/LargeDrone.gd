extends KinematicBody2D
onready var global = get_node("/root/Global")
onready var Explosions = get_node("/root/PlayerShip")
var Explosion = load("res://Assets/Explosions/ExplosionTwo.tscn")
onready var player = get_node("/root/PlayerShip/PlayerShip")

var LDHealth = 3
var speed = 10

var velocity = Vector2.ZERO
func _physics_process(delta):
	velocity = position.direction_to(player.position) * speed
	move_and_collide(velocity * speed * delta)
	pass
	
func _on_LargeDroneBody_body_entered(body):
	LDHealth -= 1

func _process(delta):
	var dir = player.position - position 
	rotation = dir.angle() + 1.57
	if LDHealth <= 0:
		var explosion = Explosion.instance()
		explosion.global_position = global_position
		Explosions.add_child(explosion)
		queue_free()
		global.playerScore += 5
	
func _on_LargeDroneBody_area_entered(area):
	LDHealth -= 1
	


