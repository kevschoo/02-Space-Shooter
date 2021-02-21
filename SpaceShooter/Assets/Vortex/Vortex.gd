extends Area2D

var sizestart = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += .1
	scale = Vector2(sizestart,sizestart)
	sizestart -= .03
	if sizestart <= 0:
		queue_free() 
