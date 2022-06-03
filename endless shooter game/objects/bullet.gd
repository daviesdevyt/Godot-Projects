extends Area2D



var speed = 800

func _process(delta):
	position.y -= speed*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bullet_area_entered(area):
	if area.is_in_group("meteors"):
		area.hp -= 1
	if area.name != "hurtbox":
		queue_free()
