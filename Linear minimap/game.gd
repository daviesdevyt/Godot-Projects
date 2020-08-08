extends Node2D


var checkpoint_scene = preload("res://check_sign.tscn")
var checkpoint_pos = 0
var max_checkpoints = 4



func _ready():
	for i in range(max_checkpoints):
		
		checkpoint_pos += 1000 # Distance between checkpoints
		
		var checkpoint = checkpoint_scene.instance()
		
		checkpoint.get_node("Label").text = 'Checkpoint' + str(i+1)
		checkpoint.name = str(i+1)
		
		if i+1 == max_checkpoints:
			checkpoint.get_node("Label").text = 'Finish'
		
		checkpoint.global_position = Vector2(checkpoint_pos, 460)
		$signs.add_child(checkpoint)
	














