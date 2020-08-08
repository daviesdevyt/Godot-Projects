extends CanvasLayer


var screen_size = Vector2()
var ready = true
const Yoffset = 50
var end_pos
var Xoffset
var map_scale

func _ready():
	screen_size = $icons.get_viewport_rect().size
	Xoffset = screen_size.x/4

func _process(delta):
# get player current position
	var pos = get_parent().global_position
# Artificial ready function lol ;)
	if ready:
		var all_checkpoints = get_tree().current_scene.get_node('signs').get_children()
# Get the last checkpoint sign global x position
		end_pos = all_checkpoints[all_checkpoints.size()-1].global_position.x
		map_scale = (screen_size.x/2) / end_pos
# Create sprite for signs in the minimap
		for checkP in all_checkpoints:
			var i = $icons/sign.duplicate()
			$icons.add_child(i); i.show()
			i.position.x = (checkP.global_position.x * map_scale) + Xoffset
		
		$Line2D.add_point(Vector2(Xoffset, Yoffset), 0)
		$Line2D.add_point(Vector2(screen_size.x*0.75, Yoffset), 1)
		$icons/player.position = Vector2(Xoffset, Yoffset)
		ready = false
# Update player position in minimap
	$icons/player.position.x = (pos.x * map_scale) + Xoffset
	
	
























