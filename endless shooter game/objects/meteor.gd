extends Area2D

var explode = preload("res://objects/explosion.tscn")

var textures = [
					"meteorGrey_big1.png",
					"meteorGrey_big2.png",
					"meteorGrey_big3.png",
					"meteorGrey_big4.png"
				]

var hp = 3 setget change_hp

func change_hp(value):
	hp = value
	if hp <= 0:
		destroy()
		get_node("/root/Game").points += 1

func destroy():
	var e = explode.instance()
	e.global_position = global_position
	get_tree().root.add_child(e)
	queue_free()

func _ready():
	var random = randi() % textures.size()
	$Sprite.texture = load("res://assets/meteors/"+textures[random])


func _physics_process(delta):
	position.y += 200*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
