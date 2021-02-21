extends KinematicBody2D

onready var global = get_node("/root/Global")
onready var shipSprite = get_node("PlayerShipSprite")
onready var VP = get_viewport()
var LASER = preload("res://Assets/Laser/Laser.tscn")
var MISSILE = preload("res://Assets/Missile/Missile.tscn")

var cooldown = 0
var cooldownMissile = 0

export (int) var speed = 250
var velocity = Vector2()


func get_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += speed
	if Input.is_action_pressed('left'):
		velocity.x -= speed
	if Input.is_action_pressed('down'):
		velocity.y += speed
	if Input.is_action_pressed('up'):
		velocity.y -= speed
	velocity = velocity.normalized() * speed
	if Input.is_action_pressed('laser'):
		if cooldown == 0:
			fireLaser()
	if Input.is_action_pressed("missile"):
		if cooldownMissile == 0:
			fireMissile()


func fireLaser():
	var l = LASER.instance()
	l.start($Gun1.global_position, rotation)
	get_parent().add_child(l)
	cooldown = 1
	
func fireMissile():
	var m = MISSILE.instance()
	m.start($Gun2.global_position, rotation)
	get_parent().add_child(m)
	cooldownMissile = 3

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	if global.playerHealth <= 5: 
		if abs(velocity.x) > 0 or abs(velocity.y) > 0:
			shipSprite.play("MovementLowHealth")
		else:
			shipSprite.play("IdleLowHealth")
	else:
		if abs(velocity.x) > 0 or abs(velocity.y) > 0:
			shipSprite.play("Movement")
		else:
			shipSprite.play("Idle")

func _on_LaserCooldown_timeout():
	cooldown = 0

func _on_MissileCooldown_timeout():
	cooldownMissile = 0

func _on_AreaBody_area_entered(area):
	global.playerHealth -= 1
	
func _on_AreaBody_body_shape_entered(body_id, body, body_shape, area_shape):
	global.playerHealth -= 1
	
func _on_LifeTime_timeout():
	global.currentTimeAlive += 1
