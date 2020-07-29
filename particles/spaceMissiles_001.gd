extends Sprite


func _process(delta):
	if position.x > 1024:
		position.x = 0
	if position.x < 0:
		position.x = 1024
	if position.y > 600:
		position.y = 0
	if position.y < 0:
		position.y = 600
	
	
	var rot = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	rotate(deg2rad(rot*8))
	if Input.is_action_pressed("ui_select"):
		position += Vector2(0, -200).rotated(rotation) * delta
	
	
