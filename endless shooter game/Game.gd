extends Node2D

var meteor = preload("res://objects/meteor.tscn")

var points = 0 setget add_point

func add_point(value):
	points = value
	$Label/score.text = str(points)

func _ready():
	randomize()

func _on_Timer_timeout():
	$Timer.wait_time = max(0.5, $Timer.wait_time-0.01)
	var meteor_inst = meteor.instance()
	var point = randi() % $spawn_points.get_child_count()
	meteor_inst.global_position = $spawn_points.get_child(point).position
	$meteors.add_child(meteor_inst)


func _on_Button_pressed():
	get_tree().reload_current_scene()

func died():
	$failed/ColorRect.show()
	
