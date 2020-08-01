extends Node


var checkpoint_pos = 0

func save_data():
	var file = File.new()
	file.open("user://save",file.WRITE_READ)
	file.store_var(checkpoint_pos)
	file.close()


func load_data():
	var file = File.new()
	if not file.file_exists("user://save"):
		return false
	file.open("user://save",file.READ)
	checkpoint_pos = file.get_var()
	file.close()
	return true



