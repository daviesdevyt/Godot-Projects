extends Node2D


var checkpoint_scene = preload("res://checkpoint.tscn")
var sign_pos = 0



func _ready():
	for i in range(5):
		var checkpoint = checkpoint_scene.instance()
		checkpoint.get_node("Label").text = 'Checkpoint' + str(i+1)
		checkpoint.global_position = Vector2(1367 * (i+1), 465)
		$checkpoint_container.add_child(checkpoint)
	











