extends Control





func _ready():
	for level in range($levels.get_child_count()):
		global.levels.append(level+1) # Attach all levels to global.levels array i.e [1,2,3,4, .... number of levels]
	
	for level in $levels.get_children():
		if str2var(level.name) in range(global.unlockedLevels+1): # Check if the level is already unlocked
			level.disabled = false
			level.connect('pressed', self, 'level_button_pressed',
							[level.name]) # Connect the signal of all enabled buttons with an extra variable attached
		else:
			level.disabled = true #Disable all unlocked level buttons
	


func level_button_pressed(lvl_no):
	get_tree().change_scene("res://Node2D"+ lvl_no +".tscn") # Change scene to any selected level
	



