extends Node2D
var move = Vector2()
func _ready():
	move = Vector2(600, 0).rotated(rotation)

func _process(delta):
	position += move * delta
