extends Node2D
var screensize
func _ready():
	screensize = get_viewport_rect().size
	position = screensize/2
func _physics_process(delta):
	if position.x > screensize.x:
		position.x = 0
	if position.x < 0:
		position.x = screensize.x
	if position.y > screensize.y:
		position.y = 0
	if position.y < 0:
		position.y = screensize.y
	var pos = get_viewport().get_mouse_position()
	look_at(pos)
	position += Vector2(200,0).rotated(rotation) * delta
		
