extends Area2D



@onready var bigCircle = $BigCircle
@onready var smallCircle = $BigCircle/SmallCircle
@onready var max_distance = $CollisionShape2D.shape.radius

var touched = false

func _input(event):
	if event is InputEventScreenTouch:
		var distance = event.position.distance_to(bigCircle.global_position)
		if not touched:
			if distance < max_distance:
				touched = true
			else:
				# Reset smallCircle's position if it's out of range
				smallCircle.global_position = bigCircle.global_position + max_distance * (event.position - bigCircle.global_position).normalized()
				touched = true

func _process(delta):
	if touched:
		smallCircle.global_position = get_global_mouse_position()
		var dist = smallCircle.global_position - bigCircle.global_position
		if dist.length() > max_distance:
			smallCircle.global_position = bigCircle.global_position + dist.normalized() * max_distance

func get_velo():
	var joy_velo = Vector2(0,0)
	joy_velo.x = smallCircle.position.x / max_distance
	joy_velo.y = smallCircle.position.y / max_distance
	return joy_velo
